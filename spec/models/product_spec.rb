require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before :each do
    @test_category = Category.new(name: "Rarest Bushes")
    @product = Product.new(name: "shrub", price: 5, quantity: 11, category: @test_category)
  end

  describe 'Validations' do
    it "should be valid with all valid attributes" do
      @product.save
      expect(@product).to be_valid
    end
    
    it "should be invalid without a name" do
      @product.name = nil
      @product.save
      # byebug to see specifics
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end
    
    it "should be invalid without a price" do
      @product.price_cents = nil 
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
      @product.price_cents = 5
    end
    
    it "should be invalid without a quantity" do
      @product.quantity = nil 
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end
    
    it "should be invalid without a category" do
      @product.category = nil 
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages[0]).to eq("Category must exist")
    end
  end
end
