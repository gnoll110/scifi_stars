require "rails_helper"

RSpec.feature "Welcome", :type => :feature do
  scenario "Naviate to homepage" do
    visit "/"

    expect(page).to have_text("Welcome")
  end

  scenario "Star page via name" do
    visit "/"

    fill_in "Star", :with => "Barnard's Star"
    click_button "Search"

    expect(page).to have_text("Barnard's Star")
  end
end
