require 'rails_helper'

feature 'user views vendor list', %{
  As visitor
  I want to view a list of all available food trucks/vendors
  So that I can decide what food truck/vendors I want to visit
} do
  # Acceptance Criteria

  # All vendors should be visible on this page
  # I should be able to get to this page via clicking on a link from the home page

  scenario 'visitor can view the list of vendors via the vendors link' do
    visit root_path
    expect(page).to have_content('Vendors')
    vendor = FactoryGirl.create(:vendor)
    click_link 'Vendors'
    expect(page).to have_content(vendor.vendor_name)
  end

end
