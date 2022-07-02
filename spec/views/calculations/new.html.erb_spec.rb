require 'rails_helper'

RSpec.describe "calculations/new", type: :view do
  before(:each) do
    assign(:calculation, Calculation.new(
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

  it "renders new calculation form" do
    render

    assert_select "form[action=?][method=?]", calculations_path, "post" do

      assert_select "input[name=?]", "calculation[basic_pay]"

      assert_select "input[name=?]", "calculation[allowances]"

      assert_select "input[name=?]", "calculation[gross_pay]"

      assert_select "input[name=?]", "calculation[taxable_pay]"

      assert_select "input[name=?]", "calculation[tax]"

      assert_select "input[name=?]", "calculation[tax_relief]"

      assert_select "input[name=?]", "calculation[paye]"

      assert_select "input[name=?]", "calculation[nhif]"

      assert_select "input[name=?]", "calculation[nssf]"

      assert_select "input[name=?]", "calculation[net_pay]"
    end
  end
end
