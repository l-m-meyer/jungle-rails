require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save a valid product' do
      @category = Category.create(name: 'Containers')
      product = Product.new(
        name: 'Terracotta Pots',
        price: 35.00,
        category_id: @category.id,
        quantity: 20
      )

      expect(product).to be_valid
    end

    it 'should not save without a valid name' do
      @category = Category.create(name: 'Fresh Air')
      name = Product.new(
        name: nil,
        price: 20.00,
        category_id: @category.id,
        quantity: 11
      )

      expect(name).to_not be_valid
    end
  end
end
