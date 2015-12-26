require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Validations' do
    let(:category) { create(:category) }
    it 'validate presence of name' do
      category.name = nil
      category.valid?
      expect(category.errors.include?(:name)).to eq(true)
    end
  end
end
