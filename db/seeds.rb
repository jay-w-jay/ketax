# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if TaxBracket.all.count.zero?
  TaxBracket.create!(
    id: 1, min: 0.00, max: 24_000, rate: 10.00
  )
  TaxBracket.create!(
    id: 2, min: 24_000.00, max: 32_333.00, rate: 25.00
  )
  TaxBracket.create!(
    id: 3, min: 32_333, max: 999_999_999.00, rate: 30.00
  )
end
