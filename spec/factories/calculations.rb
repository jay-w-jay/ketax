FactoryBot.define do
  factory :calculation do
    basic_pay { Faker::Number.between(from: 4_567, to: 987_654) }
  end
end
