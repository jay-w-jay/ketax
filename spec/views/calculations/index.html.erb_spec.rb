require 'rails_helper'

RSpec.describe "calculations/index", type: :view do
  let!(:calc_1) { create(:calculation, basic_pay: 10_000) }
  let!(:calc_2) { create(:calculation, basic_pay: 10_000) }
  before(:each) do
    assign(:calculations, [
      calc_1,
      calc_2
    ])
  end

  it "renders a list of calculations" do
    render
    assert_select 'tr>td', text: '10000.0'.to_s, count: 2
  end
end
