require 'rails_helper'

feature 'visitor searches for a vendor', %{
  As a visitor
  I want to search for a vendor by name
  So that I can find my favorite vendor
} do

  scenario 'visitor searches for a non-existent vendor name' do
    visit vendors_path
    fill_in 'Search Vendors', with: 'Thai'
    click_button 'Search'
    expect(page).to_not have_content('Thai')
    expect(page).to have_content('We didn\'t find anything')
  end

  scenario 'visitor searches for a valid vendor name' do
    vendor = FactoryGirl.create(:vendor)
    visit vendors_path
    fill_in 'Search Vendors', with: vendor.vendor_name
    click_button 'Search'
    expect(page).to have_content(vendor.vendor_name)
  end
end
