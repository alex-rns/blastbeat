require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:all) do
    @product = Product.create(title: "test-title", brand: "test-brand", price: 123, manufacturer: "Ukraine", category: "bahbah")
  end

  describe "#create" do
    it "checks that a product can be created" do
      expect(Product.find_by_title("test-title")).to be_valid
    end
    it "is not valid without a title" do
      @product.update(title: nil)
      expect(@product).to_not be_valid
    end
    it "is not valid with string price" do
      @product.update(price: "wow")
      expect(@product).to_not be_valid
    end
  end

  describe "#pass_title" do
    it "return title" do
      expect(@product.pass_title).to eql(@product.title)
    end
  end

end

RSpec.describe Product, type: :system do
  describe "#new" do
    it 'show text in the create product page' do
      visit new_product_path
      expect(page).to have_content('Create new product')
    end
    it 'empty fields' do
      visit new_product_path
      click_button 'Create Product'
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Price can't be blank")
      expect(page).to have_content("Category can't be blank")
      expect(page).to have_content("Brand can't be blank")
      expect(page).to have_content("Manufacturer can't be blank")
      expect(page).to have_content("Title is too short (minimum is 2 characters)")
      expect(page).to have_content("Category is too short (minimum is 2 characters)")
      expect(page).to have_content("Brand is too short (minimum is 2 characters)")
      expect(page).to have_content("Price is not a number")
      expect(Product.count).to eq(1)
    end
    it 'valid fields' do
      visit new_product_path
      fill_in 'Title', with: 'ValidTitle'
      fill_in 'Price', with: '1'
      fill_in 'Category', with: 'Category'
      fill_in 'Brand', with: 'Brand'
      fill_in 'Manufacturer', with: 'Manufacturer'
      click_button 'Create Product'
      expect(Product.count).to eq(2)
      expect(Product.last.title).to eq('ValidTitle')
    end
  end

end