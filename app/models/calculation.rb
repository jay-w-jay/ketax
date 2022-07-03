class Calculation < ApplicationRecord

  validates :basic_pay, presence: true
  validates :allowances, presence: true
  validates :gross_pay, presence: true
  validates :taxable_pay, presence: true
  validates :tax, presence: true
  validates :nhif, presence: true
  validates :nssf, presence: true
  validates :tax_relief, presence: true
  validates :paye, presence: :true
  validates :net_pay, presence: true

  def recalculate
    calculate_gross_pay
    calculate_nssf
    calculate_taxable_pay
    calculate_tax_relief
    self.nhif = calculate_nhif
    self.tax = calculate_tax(taxable_pay)
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

  def calculate_tax(taxable_pay)
    tax = 0
    tax = 0.1 * taxable_pay if taxable_pay <= 24_000
    tax = (0.25 * (taxable_pay - 24_000)) + 2400 if 24_001 <= taxable_pay && taxable_pay <= 32_333
    tax = (0.3 * (taxable_pay - 32_333)) + 2083.25 + 2400 if taxable_pay > 32_333
    tax = 0 if tax < 1
    tax.ceil
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
end
