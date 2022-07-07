class Api::V1::PayeController < Api::BaseController
  def index
    @calculations = Calculation.all
    render json: @calculations
  end

  def calculate
    basic_pay = params[:basic_pay].to_f
    if Calculation.where(basic_pay: basic_pay).exists?
      calculation = Calculation.where(basic_pay: basic_pay).first
    else
      calculation = Calculation.create(basic_pay: basic_pay)
    end
    calculation.recalculate
    render json: calculation, include: [:calculation_tax_brackets => { :include => :tax_bracket }]
  end
end
