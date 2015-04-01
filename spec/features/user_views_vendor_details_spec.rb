require 'rails_helper'

feature 'user views vendor details', %Q{
  As a visitor
  I want to view the details of a specific truck/vendor
  So that I can learn more about the truck/vendor I’m interested in visiting
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
