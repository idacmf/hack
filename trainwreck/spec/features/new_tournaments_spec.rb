require 'rails_helper'

RSpec.feature "Creating tournaments" do
  before do
    visit "/"
  end

  scenario "log in" do
    click_link "Get Started!"
    fill_in "Email", with: "test@test.no"
    fill_in "Password", with: "abc12345"
    fill_in "Password confirmation", with: "abc12345"
    fill_in "First name", with: "tester"
    fill_in "Surname", with: "testersen"
    fill_in "Address", with: "testby"
    fill_in "City", with: "testcity"
    fill_in "Phone number", with: "12345678"
    click_button "Sign up"

  end

  scenario "can create a new tournament" do
    click_link "Create A New Tournament"
    expect(page).to have_content("Make New Tournament")
    fill_in "Name", with: "fotball2016"
    fill_in "Location", with: "Tromsø"
    fill_in "Max teams", with: "10"
    click_button "Create new tournament"
    expect(page).to have_content("New tournament has been created.")
  end




end