class CalculationTaxBracket < ApplicationRecord
  belongs_to :calculation
  belongs_to :tax_bracket
end
