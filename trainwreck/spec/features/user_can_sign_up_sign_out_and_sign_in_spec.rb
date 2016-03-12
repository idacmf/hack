require 'rails_helper'

RSpec.feature "User can sign in" do

  before do
    visit '/'
    click_link "Sign Up"
    fill_in "Email", with: "rspec@user.no"
    fill_in "Password", with: "rspec1234"
    fill_in "Password confirmation", with: "rspec1234"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
    click_link "Sign Out"
  end

  scenario "can sign in" do
    click_link "Log In"
    fill_in "Email", with: "rspec@user.no"
    fill_in "Password", with: "rspec1234"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
  end
end