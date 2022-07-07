FactoryBot.define do
  factory :calculation_tax_bracket do
    calculation { nil }
    tax_bracket { nil }
    amount { "9.99" }
    rate { "9.99" }
    total { "9.99" }
  end
end
