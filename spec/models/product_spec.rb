require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully with all fields set' do
      @category = Category.new
      @category.name = 'Kitchen'
      @category.save!
      expect(@category.created_at).to be_present

      @product = Product.new
      @product.name = 'Blender'
      @product.price_cents = 100000
      @product.quantity = 2
      @product.category_id = @category.id
      @product.save!

      expect(@product).to be_valid

    end

    it 'should validate presence of name' do
      @category = Category.new
      @category.name = 'Kitchen'
      @category.save!

      @product = Product.create(name: nil, price_cents: 10000, quantity: 2, category_id: @category.id)

      expect(@product.errors.full_messages).to include ("Name can't be blank")
    end

    it 'should validate presence of price' do
      @category = Category.create(name: 'Kitchen')

      @product = Product.create(name: 'Spatula', price_cents: nil, quantity: 1, category_id: @category.id)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should validate presence of quantity' do
      @category = Category.create(name: 'Kitchen')

      @product = Product.create(name: 'Spatula', price_cents: 1000, quantity: nil, category_id: @category.id)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should validate presence of category' do
      @product = Product.create(name: 'Spatula', price_cents: 10000, quantity: 50, category_id: nil)

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
