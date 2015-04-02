require 'rails_helper'

feature 'member posts vendor review', %{
  As a reviewer
  I want to be able to leave a review for a specific truck
  So that I can share my experience with other users
} do

  scenario 'member posts a new review for a specific vendor' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    vendor = FactoryGirl.create(:vendor)
    visit vendor_path(vendor)

    fill_in 'Comments:', with: 'Peanut M&Ms, Nougaty, Purpley'
    choose '3'
    click_button 'Create Review'
    expect(page).to have_content('Peanut')
  end

  scenario 'member tries to post a vendor review' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    vendor = FactoryGirl.create(:vendor)
    visit vendor_path(vendor)

    click_button 'Create Review'
    expect(page).to have_content("Rating can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
