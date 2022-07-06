class AddDefaultTaxBrackets < ActiveRecord::Migration[6.1]
  def up
    TaxBracket.create!(
      min: 0.00, max: 24_000, rate: 10.00
    )
    TaxBracket.create!(
      min: 24_000.00, max: 32_333.00, rate: 25.00
    )
    TaxBracket.create!(
      min: 32_333, max: 999_999_999.00, rate: 30.00
    )
  end

  def down
    TaxBracket.destroy_all
  end
end
