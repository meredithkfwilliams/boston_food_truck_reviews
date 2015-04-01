require 'rails_helper'

feature 'member posts vendor review', %{
  As a reviewer
  I want to be able to leave a review for a specific truck
  So that I can share my experience with other users
} do

  scenario 'visitor tries to post a vendor review' do
    vendor = FactoryGirl.create(:vendor)
    visit vendor_path(vendor)
    expect(page).to have_no_content('You')
  end

  scenario 'member posts a new review for a specific vendor' do
    member = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: member.email
    fill_in 'Password', with: member.password
    click_button 'Log in'
    vendor = FactoryGirl.create(:vendor)
    visit vendor_path(vendor)

    fill_in 'Comments:', with: 'Peanut M&Ms, Nougaty, Purpley'
    choose '3'
    click_button 'Create Review'
    expect(page).to have_content('Peanut')
  end
end
