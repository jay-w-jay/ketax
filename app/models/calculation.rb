class Calculation < ApplicationRecord
  has_many :calculation_tax_brackets, dependent: :destroy
  has_many :tax_brackets, through: :calculation_tax_brackets

  validates :basic_pay, presence: true
  validates :allowances, presence: true
  validates :gross_pay, presence: true
  validates :taxable_pay, presence: true
  validates :tax, presence: true
  validates :nhif, presence: true
  validates :nssf, presence: true
  validates :tax_relief, presence: true
  validates :paye, presence: true
  validates :net_pay, presence: true

  validate :validate_basic_pay

  def validate_basic_pay
    if basic_pay && basic_pay < 1
      errors.add(:basic_pay, 'Basic pay must be greater than 1')
    end
  end

  def recalculate
    save!
    calculate_gross_pay
    calculate_nssf
    calculate_taxable_pay
    calculate_tax_relief
    generate_tax_brackets
    self.nhif = calculate_nhif
    self.tax = calculate_tax
    calculate_paye
    calculate_net_pay
    save!
  end

  def calculate_gross_pay
    self.gross_pay = basic_pay + allowances
  end

  def calculate_taxable_pay
    self.taxable_pay = gross_pay - nssf
  end

  def calculate_tax_relief
    self.tax_relief = 2400
  end

  def calculate_paye
    self.paye = tax - tax_relief
    self.paye = 0 if paye.negative?
  end

  def calculate_tax
    calculation_tax_brackets.sum(:total).ceil
  end

  def calculate_nssf
    self.nssf = 200
  end

  def calculate_nhif
    return 0 if gross_pay <= 0
    return 150 if gross_pay < 6000

    return 300 if gross_pay > 5999 && gross_pay < 8000
    return 400 if gross_pay > 7999 && gross_pay < 12_000
    return 500 if gross_pay > 11_999 && gross_pay < 15_000
    return 600 if gross_pay > 14_999 && gross_pay < 20_000
    return 750 if gross_pay > 19_999 && gross_pay < 25_000
    return 850 if gross_pay > 24_999 && gross_pay < 30_000
    return 900 if gross_pay > 29_999 && gross_pay < 35_000
    return 950 if gross_pay > 34_999 && gross_pay < 40_000
    return 1000 if gross_pay > 39_999 && gross_pay < 45_000
    return 1100 if gross_pay > 44_999 && gross_pay < 50_000
    return 1200 if gross_pay > 49_999 && gross_pay < 60_000
    return 1300 if gross_pay > 59_999 && gross_pay < 70_000
    return 1400 if gross_pay > 69_999 && gross_pay < 80_000
    return 1500 if gross_pay > 79_999 && gross_pay < 90_000
    return 1600 if gross_pay > 89_999 && gross_pay < 100_000
    return 1700 if gross_pay > 99_999

    0
  end

  def calculate_net_pay
    self.net_pay = gross_pay - paye - nssf - nhif
  end

  def generate_tax_brackets
    calculation_tax_brackets.destroy_all
    TaxBracket.order(min: :asc).each do |bracket|
      if taxable_pay > bracket.min
        amount_to_use = [taxable_pay - bracket.min, bracket.max - bracket.min].min
        calculation_tax_brackets.create(
          tax_bracket: bracket,
          amount: amount_to_use,
          rate: bracket.rate,
          total: amount_to_use * (bracket.rate / 100)
        )
      end
    end
  end
end
