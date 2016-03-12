require 'rails_helper'

RSpec.feature "View specific tournament" do
  before do
    visit "/"
  end

  scenario "Search for existing tournament" do
    click_link "Go here"
    fill_in "Search for tournament:", with: "SomeTourn"
    click_button "Search"

  end

  scenario "Search for not existing tournament" do
    click_link "Go here"
    fill_in('Search for tournament:', with: 'SomeTourngibberish')
    click_button "Search"
    expect(page).to have_content("Tournament does not exist")
  end
end