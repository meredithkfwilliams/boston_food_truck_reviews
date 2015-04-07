require 'rails_helper'

feature 'admin manages vendor page', %{
  As an admin
  I want to delete or approve a vendor
  So that users can see appropriate vendors
} do

  let!(:category) { FactoryGirl.create(:category) }

  scenario 'admin approves a valid vendor' do
    member = FactoryGirl.create(:user, user_type: 'Admin')
    sign_in(member)
    visit vendors_path
    fill_in 'Vendor Name', with: 'Crepe Truck'
    select('Breakfast', from: 'vendor_category_ids')
    click_button 'Add Vendor'
    click_button 'Approve'
    expect(page).to have_content('Vendor Updated')
    expect(page).to have_content('Crepe Truck')
  end

  scenario 'admin deletes an unacceptable vendor' do
    member = FactoryGirl.create(:user, user_type: 'Admin')
    sign_in(member)
    visit vendors_path
    fill_in 'Vendor Name', with: 'Crepe Truck'
    select('Breakfast', from: 'vendor_category_ids')
    click_button 'Add Vendor'
    click_button 'Delete'
    expect(page).to have_content('Vendor Deleted')
    expect(page).to_not have_content('Crepe Truck')
  end
end
