require 'rails_helper'

feature 'admin manages vendor page', %{
  As an admin
  I want to delete or approve a vendor
  So that users can see appropriate vendors
} do

  let!(:category) { FactoryGirl.create(:category) }
  let!(:vendor) { FactoryGirl.create(:vendor) }
  let!(:admin) { FactoryGirl.create(:user, user_type: 'Admin') }
  
  scenario 'admin approves a valid vendor' do
    sign_in(admin)
    create_vendor(vendor)
    click_button 'Approve'
    expect(page).to have_content('Vendor Updated')
    expect(page).to have_content(vendor.vendor_name)
  end

  scenario 'admin deletes an unacceptable vendor' do
    sign_in(admin)
    create_vendor(vendor)
    click_button 'Delete'
    expect(page).to have_content('Vendor Deleted')
  end
end
