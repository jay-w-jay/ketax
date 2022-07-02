require 'rails_helper'

RSpec.describe "calculations/index", type: :view do
  before(:each) do
    assign(:calculations, [
      Calculation.create!(
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
      ),
      Calculation.create!(
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
      )
    ])
  end

  it "renders a list of calculations" do
    render
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
