require 'rails_helper'

feature 'member adds a vendor', %{
  As a member
  I want to add a vendor
  So that users can share reviews about this vendor
} do

  let!(:category) { FactoryGirl.create(:category) }

  scenario 'visitor tries to add a vendor' do
    visit vendors_path
    expect(page).to_not have_button('Add Vendor')
  end

  scenario 'member tries to add a new vendor' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    visit vendors_path
    fill_in 'Vendor Name', with: 'Bacon Truck'
    select('Breakfast', from: 'vendor_category_ids')
    click_button 'Add Vendor'
    expect(page).to have_content('Vendor added. Pending review.')
  end

  scenario 'admin tries to add a new vendor' do
    member = FactoryGirl.create(:user, user_type: 'Admin')
    sign_in(member)
    visit vendors_path
    fill_in 'Vendor Name', with: 'Crepe Truck'
    select('Breakfast', from: 'vendor_category_ids')
    click_button 'Add Vendor'
    expect(page).to have_content('Vendor added. Pending review.')
  end
end
