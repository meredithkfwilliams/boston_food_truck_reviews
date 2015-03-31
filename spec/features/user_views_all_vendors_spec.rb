require 'rails_helper'

feature 'user views all vendors', %Q{
  As a visitor
  I want to view a list of all available food trucks
  So that I can decide which vendor I want to visit
} do
  # Acceptance Criteria

  # * As a visitor
  # * When I visit the home page
  # * I should be able to click on a link to view all vendors.

  # * As a visitor
  # * When I visit the vendors page
  # * I should be able to see the list of vendors.

  scenario 'visitor can view the list of vendors via the vendors link' do
    visit root_path
    expect(page).to have_content('View all vendors')
    click_link 'View all vendors'
    expect(page).to have_content('Vendor List')
  end

  scenario 'visitor views list of vendors successfully' do
    vendor = FactoryGirl.create(:vendor)
    visit vendors_path
    expect(page).to have_content('Vendor 1')
  end

end
