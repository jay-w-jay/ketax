class TaxBracket < ApplicationRecord
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
