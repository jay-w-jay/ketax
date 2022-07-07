class TaxBracket < ApplicationRecord
  has_many :calculation_tax_brackets, dependent: :destroy
  has_many :calculations, through: :calculation_tax_brackets

  def human_max
    if max > 32_333.00
      '∞'
    else
      max
    end
  end

  def annual_min
    min * 12
  end

  def annual_max
    if max > 32_333.00
      '∞'
    else
      max * 12
    end
  end
end
