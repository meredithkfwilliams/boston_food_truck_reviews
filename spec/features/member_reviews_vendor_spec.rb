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

  scenario "visitor shouldn't be able to see the review form" do
    vendor = FactoryGirl.create(:vendor)
    visit vendor_path(vendor)

    expect(page).to have_no_content('Create Review')
  end

  scenario 'member should be able to delete a review if theyre the owner of said review' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    vendor = FactoryGirl.create(:vendor)
    review = FactoryGirl.create(:review, vendor: vendor, user: user)
    visit vendor_path(vendor)

    click_button 'Delete Review'
    expect(page).to have_no_content(review)
  end
  # 
  # scenario 'member should be able to edit a review of theyre the owner of said review' do
  #   user = FactoryGirl.create(:user)
  #   sign_in(user)
  #   vendor = FactoryGirl.create(:vendor)
  #   review = FactoryGirl.create(:review, vendor: vendor, user: user)
  #   visit vendor_path(vendor)
  #   click_button 'Edit Review'
  #   fill_in 'Comment:', with: 'Hello'
  # end
end
