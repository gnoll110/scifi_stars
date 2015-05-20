require "rails_helper"

RSpec.feature "Welcome", :type => :feature do
  before :each do
    @smith = Star.create(
      name: 'Barnard\'s Star'
    )
    @jones = Star.create(
      name: 'Deneb'
    )
    @johnson = Star.create(
      name: 'Vega'
    )
  end

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

  scenario "Star page via bad name" do
    visit "/"

    fill_in "Star", :with => "Barnard's Blackhole"
    click_button "Search"

    expect(page).to have_text("NotFound")
  end
end
