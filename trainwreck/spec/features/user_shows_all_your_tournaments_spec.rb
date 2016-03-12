require 'rails_helper'

RSpec.feature "Viewing all my tournaments" do

  before do
    visit '/'
    click_link "Sign Up"
    fill_in "Email", with: "rspec@user.no"
    fill_in "Password", with: "rspec1234"
    fill_in "Password confirmation", with: "rspec1234"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "can view all my tournaments" do
    click_link "My Tournaments"
    expect(page).to have_content("Your tournaments")
  end

end