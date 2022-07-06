class AddDefaultTaxBrackets < ActiveRecord::Migration[6.1]
  def up
    TaxBracket.create!(
      min: 0.00, max: 12_298.00, rate: 10.00
    )
    TaxBracket.create!(
      min: 12_299.00, max: 23_885.00, rate: 15.00
    )
    TaxBracket.create!(
      min: 23_886, max: 35_472.00, rate: 20.00
    )
    TaxBracket.create!(
      min: 35_473, max: 47_059.00, rate: 25.00
    )
    TaxBracket.create!(
      min: 47_060.00, max: 999_999_999.00, rate: 30.00
    )
  end

  def down
    TaxBracket.destroy_all
  end
end
