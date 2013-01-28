require 'spec_helper'

describe "Product Pages" do

  subject { page }

  describe "new products" do

    let(:submit) { "Create Product" }
    before { visit new_product_path }

    describe "new product page" do
      it { should have_selector('h2', text: 'Add a new product') }
      it { should have_field('product_name') }
      it { should have_field('product_description') }
      it { should have_button('Create Product') }
    end

    describe "add new product with correct information" do
      before  do
        fill_in "product_name",         with: "Sample Product"
        fill_in "product_description",  with: "lorem ipsum" * 200
      end

      it "should add a new Product" do
        expect { click_button submit }.to change(Product, :count).by(1)
      end

      describe "should display the product information on the page" do
        before { click_button submit }

        it { should have_content("Sample Product")}
        it { should have_content("lorem ipsum") }
      end
    end
  end

  describe "edit products" do
    let(:submit) { "Update Product" }
    let(:product) { FactoryGirl.create(:product) }
    before do
      visit edit_product_path(product) 
    end

    it { should have_content("Edit Product") }
    it { should have_field('product_name') }
    it { should have_field('product_description') }
    it { should have_button('Update Product') }

    describe "update the product name" do
      
      context "with valid information" do
        before do
          fill_in "product_name", with: "New Product Name" 
          click_button submit
        end 
        it { should have_content ("Product successfully updated") }
        it { should have_content ("New Product Name") }
      end

      context "with invalid information" do
        before do
          fill_in "product_description", with: "Short description" 
          click_button submit
        end 
        it { should have_content ("The form contains 1 error") }
      end
    end
  end

  describe "view products" do
    before do
      FactoryGirl.create(:product)
      visit products_path
    end 
    it { should have_content ("Products") }
    it { should have_content ("MyString") }
  end

  describe "delete products" do
    let(:product) { FactoryGirl.create(:product) }
    before do
      visit product_path(product)
      click_link "Delete Product"
    end
    it { should have_content ("Product successfully deleted") }
  end

  
end