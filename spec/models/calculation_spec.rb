require 'rails_helper'

RSpec.describe Calculation, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:basic_pay) }
    it { should validate_presence_of(:allowances) }
    it { should validate_presence_of(:gross_pay) }
    it { should validate_presence_of(:taxable_pay) }
    it { should validate_presence_of(:tax) }
    it { should validate_presence_of(:tax_relief) }
    it { should validate_presence_of(:paye) }
    it { should validate_presence_of(:nhif) }
    it { should validate_presence_of(:nssf) }
    it { should validate_presence_of(:net_pay) }
  end

  describe '#recalculate' do
    context 'when earning 25k with 5k allowances' do
      let!(:calculation) { create(:calculation, basic_pay: 25_000, allowances: 5_000) }
      before do
        calculation.recalculate
      end

      it 'calculates gross pay' do
        expect(calculation.gross_pay).to eq(30_000)
      end

      it 'calculates taxable pay' do
        expect(calculation.taxable_pay).to eq(29_800)
      end

      it 'calculates tax' do
        expect(calculation.tax).to eq(3_850)
      end

      it 'calculates tax relief' do
        expect(calculation.tax_relief).to eq(2_400)
      end

      it 'calculates paye' do
        expect(calculation.paye).to eq(1_450)
      end

      it 'calculates nhif' do
        expect(calculation.nhif).to eq(900)
      end

      it 'calculates nssf' do
        expect(calculation.nssf).to eq(200)
      end

      it 'calculates net pay' do
        expect(calculation.net_pay).to eq(27_450)
      end
    end

    context 'when earning 295_800 with 24_250 allowances' do
      let!(:calculation) { create(:calculation, basic_pay: 295_800, allowances: 24_250) }
      before do
        calculation.recalculate
      end

      it 'calculates gross pay' do
        expect(calculation.gross_pay).to eq(320_050)
      end

      it 'calculates taxable pay' do
        expect(calculation.taxable_pay).to eq(319_850)
      end

      it 'calculates tax' do
        expect(calculation.tax).to eq(90_739)
      end

      it 'calculates tax relief' do
        expect(calculation.tax_relief).to eq(2_400)
      end

      it 'calculates paye' do
        expect(calculation.paye).to eq(88_339)
      end

      it 'calculates nhif' do
        expect(calculation.nhif).to eq(1_700)
      end

      it 'calculates nssf' do
        expect(calculation.nssf).to eq(200)
      end

      it 'calculates net pay' do
        expect(calculation.net_pay).to eq(229_811)
      end
    end
  end
end
