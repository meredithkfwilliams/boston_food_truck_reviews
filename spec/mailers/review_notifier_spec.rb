require "rails_helper"

feature 'admin approves or denies business ownership', %{
  As an admin
  I want to see pending ownership requests
  So that I approve or deny said requests
} do

  scenario "review a product" do
    ActionMailer::Base.deliveries.clear
    owner = FactoryGirl.create(:user)
    sign_in(owner)
    vendor = FactoryGirl.create(:vendor)
    vendor.update(claimed_status: "Claimed", owner_id: owner.id)
    FactoryGirl.create(:review, vendor: vendor)
    visit vendor_path(vendor)
    choose '1'
    fill_in "Comments", with: "Total garbage."
    click_button "Create Review"
    expect(page).to have_content("Total garbage.")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

end
