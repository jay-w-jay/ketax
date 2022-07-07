require 'rails_helper'

RSpec.describe TaxBracket, type: :model do
  describe 'tax brackets' do
    context 'when checking default' do
      it 'checks number of tax brackets' do
        expect(TaxBracket.count).to eq(3)
      end
    end
  end
end
