require 'spec_helper'

describe Product do
  before(:each) do
    @attr = { 
      :name => "Product Name",
      :description => "Lorem ipsum" * 200 }
  end
  
  it "should create a new instance given a valid attribute" do
    Product.create!(@attr).should be_valid
  end

  it "should require a product name" do
    no_name_product = Product.new(@attr.merge(:name => ""))
    no_name_product.should_not be_valid
  end

  it "should require a product description" do
    no_description_product = Product.new(@attr.merge(:description => ""))
    no_description_product.should_not be_valid
  end

  it "should not accept short product descriptions" do
    short_description_product = Product.new(@attr.merge(:description => "short description"))
    short_description_product.should_not be_valid
  end

  it "should not accept short product names" do
    short_product_name = Product.new(@attr.merge(:name => "a"))
    short_product_name.should_not be_valid
  end

end