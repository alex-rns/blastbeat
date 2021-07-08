# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Product', type: :feature do
  let!(:product) { create(:product) }
  scenario 'creating successfully' do
    expect(Product.count).to eql(1)
    visit new_product_path
    expect(page).to have_content('Create new product')
    fill_in 'Title', with: 'ValidTitle'
    fill_in 'Price', with: '1'
    fill_in 'Category', with: 'Category'
    fill_in 'Brand', with: 'Brand'
    fill_in 'Manufacturer', with: 'Manufacturer'
    click_button 'Create Product'
    expect(Product.count).to eq(2)
    expect(Product.first.title).to eq('Title 1')
    expect(Product.last.title).to eq('ValidTitle')
  end

  scenario 'creating unsuccessfully' do
    expect(Product.count).to eql(1)
    visit new_product_path
    click_button 'Create Product'
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Price can't be blank")
    expect(page).to have_content("Category can't be blank")
    expect(page).to have_content("Brand can't be blank")
    expect(page).to have_content("Manufacturer can't be blank")
    expect(page).to have_content('Title is too short (minimum is 2 characters)')
    expect(page).to have_content('Category is too short (minimum is 2 characters)')
    expect(page).to have_content('Brand is too short (minimum is 2 characters)')
    expect(page).to have_content('Price is not a number')
    expect(Product.count).to eq(1)
  end

  scenario 'updating successfully' do
    expect(Product.count).to eql(1)
    visit product_path(Product.last)
    click_link 'Edit product'
    expect(page).to have_content('Edit product')
    fill_in 'Title', with: 'ValidTitleAndEdited'
    click_button 'Update Product'
    expect(page).to have_content('ValidTitleAndEdited')
    expect(Product.count).to eq(1)
  end

  scenario 'updating unsuccessfully' do
    expect(Product.count).to eql(1)
    visit product_path(Product.last)
    click_link 'Edit product'
    expect(page).to have_content('Edit product')
    fill_in 'Title', with: ''
    fill_in 'Description', with: ''
    fill_in 'Price', with: ''
    fill_in 'Category', with: ''
    fill_in 'Brand', with: ''
    fill_in 'Manufacturer', with: ''
    fill_in 'Year', with: ''
    click_button 'Update Product'
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Price can't be blank")
    expect(page).to have_content("Category can't be blank")
    expect(page).to have_content("Brand can't be blank")
    expect(page).to have_content("Manufacturer can't be blank")
    expect(page).to have_content('Title is too short (minimum is 2 characters)')
    expect(page).to have_content('Category is too short (minimum is 2 characters)')
    expect(page).to have_content('Brand is too short (minimum is 2 characters)')
    expect(page).to have_content('Price is not a number')
  end

  scenario 'deleting' do
    expect(Product.count).to eql(1)
    visit product_path(Product.last)
    click_link 'Delete product'
    expect(Product.count).to eql(0)
    expect(page).to have_current_path(home_path)
  end
end
