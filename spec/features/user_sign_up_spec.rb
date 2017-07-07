require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    user = FactoryGirl.create(:user)
    visit new_user_registration_path
    fill_in 'user[username]', :with => user.username
    fill_in 'user[email]', :with => user.email
    fill_in 'user[password]', :with => user.password
    fill_in 'user[password_confirmation]', :with => user.password
    click_on 'Sign up'
    expect(page).to have_content 'Home'
  end
end
