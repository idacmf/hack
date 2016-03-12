require 'rails_helper'
#include ActionView::Helpers::UrlHelper
#config.include Capybara::DSL

RSpec.feature "Viewing all tournaments" do

  before do
    visit '/'
    click_link "Sign Up"
    fill_in "Email", with: "rspec@user.no"
    fill_in "Password", with: "rspec1234"
    fill_in "Password confirmation", with: "rspec1234"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "can view all tournaments" do
    click_link "All Tournaments"
    expect(page).to have_content("Public tournaments")
  end

end