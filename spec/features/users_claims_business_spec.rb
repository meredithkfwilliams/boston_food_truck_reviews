require 'rails_helper'

feature 'user claims business', %{
  As a user
  I want to claim that I am a business owner
  So that I can maintain my business profile
} do
  # Acceptance Criteria
  # * If I'm signed in as a member
  # * I should be able to claim unclaimed business profiles
  # * If a business has an owner, I should not be able to claim it
  # * If a business is pending ownership, I should receive an error message

  # * If I'm a visitor
  # * I should not be able to claim unclaimed business profiles

  scenario 'if business has no owner, should see claim business button' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    vendor = FactoryGirl.create(:vendor)
    visit vendor_path(vendor)
    expect(page).to have_button 'Claim Business'
  end

  scenario 'if business has an owner, should not see claim business button' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    vendor = FactoryGirl.create(:vendor)
    vendor.update(claimed_status: "Claimed")
    visit vendor_path(vendor)
    expect(page).to have_no_button 'Claim Business'
  end

  scenario 'if visitor, should not see claim business button' do
    vendor = FactoryGirl.create(:vendor)
    visit vendor_path(vendor)
    expect(page).to have_no_button 'Claim Business'
  end

  scenario 'if business pending owner, should see error when claiming' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    vendor = FactoryGirl.create(:vendor)
    vendor.update(claimed_status: "Pending")
    visit vendor_path(vendor)
    expect(page).to have_button 'Claim Business'
    click_button 'Claim Business'
    expect(page).to have_content 'This business is pending a previous ownership claim'
  end


end
