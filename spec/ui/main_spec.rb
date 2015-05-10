require "rails_helper"

RSpec.feature "Welcome", :type => :feature do
  scenario "User creates a new widget" do
    visit "/"

    expect(page).to have_text("Welcome")
  end
end
