class CreateTaxBrackets < ActiveRecord::Migration[6.1]
  def change
    create_table :tax_brackets do |t|
      t.decimal :min, null: false, default: 0.00
      t.decimal :max, null: false, default: 0.00
      t.decimal :rate, null: false, default: 0.00

      t.timestamps
    end
  end
end
