require 'rails_helper'

RSpec.feature "User can sign up" do

  before do
    visit '/'
    click_link "Sign Up"
  end

  scenario "can sign up" do
    fill_in "Email", with: "rspec@user.no"
    fill_in "Password", with: "rspec1234"
    fill_in "Password confirmation", with: "rspec1234"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
