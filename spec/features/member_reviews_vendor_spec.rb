require 'rails_helper'

feature 'member posts vendor review', %{
  As a reviewer
  I want to be able to leave a review for a specific truck
  So that I can share my experience with other users
} do


  scenario 'visitor tries to post a vendor review' do
    vendor = FactoryGirl.create(:vendor)
    visit vendor_details_path(vendor)
    expect(page).to have_no_content('You')
  end

  scenario 'member posts a new review for a specific vendor'
    member = FactoryGirl.create(:user)
    vendor = FactoryGirl.create(:vendor)
    visit vendor_details_path(vendor)

    fill_in 'Review' with 'Peanut M&Ms, Nougaty, Purpley'
    click_button 'Post'
    expect(page).to have_content('Peanut')
  end
end
