require 'rails_helper'

feature 'admin manages vendor page', %{
  As an admin
  I want to delete or approve a vendor
  So that users can see appropriate vendors
} do
  # Acceptance Criteria
  # * If I'm signed in as an admin,
  # * I should be able to see pending vendors on the vendor index page
  # * I should be able to click a button to approve/delete each vendor
  # * I should see confirmation messages when I approve/delete vendors

  let!(:category) { FactoryGirl.create(:category) }
  let!(:vendor) { FactoryGirl.create(:vendor, viewable: false) }
  let!(:admin) { FactoryGirl.create(:user, user_type: 'Admin') }

  scenario 'admin approves a valid vendor' do
    sign_in(admin)
    visit vendors_path
    click_button 'Approve'
    expect(page).to have_content('Vendor Updated')
    expect(page).to have_content(vendor.vendor_name)
  end

  scenario 'admin deletes an unacceptable vendor' do
    sign_in(admin)
    visit vendors_path
    click_button 'Delete'
    expect(page).to have_content('Vendor Deleted')
  end
end
