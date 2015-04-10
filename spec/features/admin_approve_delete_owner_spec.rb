require 'rails_helper'

feature 'admin approves or denies business ownership', %{
  As an admin
  I want to see pending ownership requests
  So that I approve or deny said requests
} do
  # Acceptance Criteria
  # * If I'm signed in as an admin,
  # * I should be able to see pending ownership claims on the vendor index page
  # * I should be able to click a button to approve/deny claims for each vendor
  # * I should see confirmation messages when I approve/deny ownership claims

  scenario 'admin should see pending ownership claims on vendor index page' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    member.update(user_type: "Admin")
    vendor = FactoryGirl.create(:vendor)
    vendor.update(claimed_status: "Pending", owner_id: member.id)
    visit vendors_path
    expect(page).to have_content vendor.vendor_name
    expect(page).to have_content member.email
    expect(page).to have_button "Approve Ownership"
    expect(page).to have_button "Deny Claim"
  end

  scenario 'admin should see message when approving ownership' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    member.update(user_type: "Admin")
    vendor = FactoryGirl.create(:vendor)
    vendor.update(claimed_status: "Pending", owner_id: member.id)
    visit vendors_path
    click_button "Approve Ownership"
    expect(page).to have_content "Owner approved."
  end

  scenario 'admin should see message when denying ownership' do
    member = FactoryGirl.create(:user)
    sign_in(member)
    member.update(user_type: "Admin")
    vendor = FactoryGirl.create(:vendor)
    vendor.update(claimed_status: "Pending", owner_id: member.id)
    visit vendors_path
    click_button "Deny Claim"
    expect(page).to have_content "Owner denied."
  end
end
