require 'rails_helper'

feature 'member votes on a review', %{
  As a reviewer
  I want to be able to leave an up or down vote on each review
  So that I can share my opinion with other users
} do

  scenario 'member posts up-vote to a review' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    vendor = FactoryGirl.create(:vendor)
    FactoryGirl.create(:review, vendor: vendor, user: member)
    visit vendor_path(vendor)

    click_button 'Up'
    expect(page).to have_content 'Overall Vote Score: 1'
  end

  scenario 'member posts down-vote to a review' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    vendor = FactoryGirl.create(:vendor)
    FactoryGirl.create(:review, vendor: vendor, user: member)
    visit vendor_path(vendor)

    click_button 'Down'
    expect(page).to have_content 'Overall Vote Score: -1'
  end

  scenario 'member up-votes then changes to down-vote' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    vendor = FactoryGirl.create(:vendor)
    FactoryGirl.create(:review, vendor: vendor, user: member)
    visit vendor_path(vendor)

    click_button 'Up'
    click_button 'Down'
    expect(page).to have_content 'Overall Vote Score: -1'
  end
end
