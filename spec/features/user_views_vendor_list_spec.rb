require 'rails_helper'

feature 'user views vendor list', %{
  As visitor
  I want to view a list of all available food trucks/vendors
  So that I can decide what food truck/vendors I want to visit
} do
  # Acceptance Criteria

  # * As a visitor
  # * When I visit the home page
  # * I should be able to click on a link to view all vendors.

  # * As a visitor
  # * When I visit the vendors page
  # * I should be able to see the list of vendors.

  scenario 'visitor can view the list of vendors via the vendors link' do
    visit vendors_path
    expect(page).to have_content('Vendors')
    vendor = FactoryGirl.create(:vendor)
    click_link 'Vendors'
    expect(page).to have_content(vendor.vendor_name)
  end

end
