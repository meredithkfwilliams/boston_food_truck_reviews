require 'rails_helper'

feature 'member posts vendor review', %{
  As a reviewer
  I want to be able to leave a review for a specific truck
  So that I can share my experience with other users
} do
  # Acceptance Criteria
  # * If I'm signed in, I should be able to rate/review vendors
  # * If I don't fill out the review form properly
  # * I get an error telling me what the issues are

  # * If I create a review for a vendor
  # * I should be able to delete it

  # * If I'm not signed in, I shouldn't be able to rate/review vendors
  # * When I view a vendors details
  # * I should not be able to view the "new review" form

  scenario 'member posts a new review for a specific vendor' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    vendor = FactoryGirl.create(:vendor)
    visit vendor_path(vendor)
    fill_in 'Comments:', with: 'Peanut M&Ms, Nougaty, Purpley'
    choose '3'
    click_button 'Create Review'
    expect(page).to have_content('Peanut M&Ms, Nougaty, Purpley')
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

  scenario "visitor shouldn't be able to see the review form" do
    vendor = FactoryGirl.create(:vendor)
    visit vendor_path(vendor)

    expect(page).to have_no_content('Create Review')
  end

  scenario 'member should be able to delete their reviews' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    vendor = FactoryGirl.create(:vendor)
    review = FactoryGirl.create(:review, vendor: vendor, user: member)
    visit vendor_path(vendor)

    click_button 'Delete Review'
    expect(page).to have_no_content(review)
  end
end
