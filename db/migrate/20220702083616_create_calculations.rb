class CreateCalculations < ActiveRecord::Migration[6.1]
  def change
    create_table :calculations do |t|
      t.decimal :basic_pay, null: false, default: 0.00
      t.decimal :allowances, null: false, default: 0.00
      t.decimal :gross_pay, null: false, default: 0.00
      t.decimal :taxable_pay, null: false, default: 0.00
      t.decimal :tax, null: false, default: 0.00
      t.decimal :tax_relief, null: false, default: 0.00
      t.decimal :paye, null: false, default: 0.00
      t.decimal :nhif, null: false, default: 0.00
      t.decimal :nssf, null: false, default: 0.00
      t.decimal :net_pay, null: false, default: 0.00

      t.timestamps
    end
  end
end
