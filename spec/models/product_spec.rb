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

      expect(name).to_not be_valid, "Invalid: #{name.errors.full_messages}"
    end

    it 'should not save without a valid price' do
      @category = Category.create(name: 'Fresh Air')
      price = Product.new(
        name: 'Spider Plant',
        price_cents: nil,
        category_id: @category.id,
        quantity: 40
      )

      expect(price).to_not be_valid, "Invalid: #{price.errors.full_messages}"
    end

    it 'should not save without a valid quantity' do
      @category = Category.create(name: 'Tools')
      quantity = Product.new(
        name: 'Spade',
        price: 6.00,
        category_id: @category.id,
        quantity: nil
      )

      expect(quantity).to_not be_valid, "Invalid: #{quantity.errors.full_messages}"
    end

    it 'should not save without a valid category id' do
      category = Product.new(
        name: 'Redwood Tree',
        price: 560.00,
        category_id: nil,
        quantity: 3
      )

      expect(category).to_not be_valid, "Invalid: #{category.errors.full_messages}"
    end
  end
end
