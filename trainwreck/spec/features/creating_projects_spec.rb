#require "rails_helper"
#require spec_helper

RSpec.feature "Users can create new projects" do
  scenario "with valid attributes" do
    visis "/"

    click_link "New Project"

    fill_in "Name", with: "Trashy Junk"
    fill_in "Description", with: "A container of waste"
    click_button "Create Project"

    expect(page).to have_content "Project has been created."
  end
end
