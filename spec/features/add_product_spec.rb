require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Sign In'
    fill_in 'user[username]', :with => user.username
    fill_in 'user[email]', :with => user.email
    fill_in 'user[password]', :with => user.password
    click_on 'Log in'
    click_on 'Add a New Product'
    product = FactoryGirl.create(:product)
    fill_in 'product[name]', :with => product.name
    fill_in 'product[description]', :with => product.description
    fill_in 'product[price]', :with => product.price
    fill_in 'product[image]', :with => product.image
    click_on 'Create Product'
    expect(page).to have_content 'User Profile'
  end
end
