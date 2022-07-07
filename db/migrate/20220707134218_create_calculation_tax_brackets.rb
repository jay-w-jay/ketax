class CreateCalculationTaxBrackets < ActiveRecord::Migration[6.1]
  def change
    create_table :calculation_tax_brackets do |t|
      t.references :calculation, null: false, foreign_key: true
      t.references :tax_bracket, null: false, foreign_key: true
      t.decimal :amount, null: false, default: 0.00
      t.decimal :rate, null: false, default: 0.00
      t.decimal :total, null: false, default: 0.00

      t.timestamps
    end
  end
end
