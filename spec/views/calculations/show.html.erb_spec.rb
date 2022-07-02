require 'rails_helper'

RSpec.describe "calculations/show", type: :view do
  before(:each) do
    @calculation = assign(:calculation, Calculation.create!(
      basic_pay: "9.99",
      allowances: "9.99",
      gross_pay: "9.99",
      taxable_pay: "9.99",
      tax: "9.99",
      tax_relief: "9.99",
      paye: "9.99",
      nhif: "9.99",
      nssf: "9.99",
      net_pay: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
