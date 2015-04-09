require 'rails_helper'

feature 'owner replies to reviews', %{
  As a vendor ownder
  I want to reply to reviews on my business
  So that users can see my comments
} do
  # Acceptance Criteria
  # * If I'm signed in as a member that owns a business
  # * I should be able to respond to reviews on my vendor profile page

  # * If I'm signed in but do not own the business
  # * I should not be able to respond to reviews on the vendor profile page

  scenario 'vendor owner can reply to reviews' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    vendor = FactoryGirl.create(:vendor)
    vendor.update(claimed_status: "Claimed", owner_id: member.id)
    FactoryGirl.create(:review, vendor: vendor)
    visit vendor_path(vendor)
    expect(page).to have_button "Add Reply"
    fill_in "Reply to review:", with: "sup"
    click_button "Add Reply"
    expect(page).to have_content "Owner Comment"
    expect(page).to have_content "sup"
  end

  scenario 'vendor owner can reply to reviews' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    vendor = FactoryGirl.create(:vendor)
    vendor.update(claimed_status: "Claimed", owner_id: member.id)
    FactoryGirl.create(:review, vendor: vendor)
    visit vendor_path(vendor)
    expect(page).to have_button "Add Reply"
    click_button "Add Reply"
    expect(page).to have_content "Comment body can't be blank"
  end

  scenario 'non-owners cannot reply to reviews' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    vendor = FactoryGirl.create(:vendor)
    vendor.update(claimed_status: "Claimed", owner_id: 80000)
    FactoryGirl.create(:review, vendor: vendor)
    visit vendor_path(vendor)
    expect(page).to have_no_button "Add Reply"
  end
  
end
