require 'rails_helper'
feature 'user views vendor details', %{
  As a visitor
  I want to view the details of a specific truck/vendor
  So that I can learn more about the truck/vendor I’m interested in visiting
} do
  # Acceptance Criteria

  # Visitors should be able to see the details of and reviews for a vendor
  # Visitors should be able to see vendor owner comments for each review

  scenario 'visitor views details of a specific vendor' do
    vendor = FactoryGirl.create(:vendor)
    visit vendors_path
    click_link vendor.vendor_name
    expect(page).to have_content(vendor.vendor_name)
  end

  scenario 'visitor views vendor details to view reviews' do
    vendor = FactoryGirl.create(:vendor)
    review = FactoryGirl.create(:review, vendor: vendor)
    visit vendor_path(vendor)
    expect(page).to have_content(review.body)
  end

  scenario 'visitor views vendor page to see reviews that have comments' do
    user = FactoryGirl.create(:user)
    vendor = FactoryGirl.create(:vendor)
    review = FactoryGirl.create(:review, vendor: vendor)
    comment = FactoryGirl.create(:comment, review: review, user: user)
    visit vendor_path(vendor)
    expect(page).to have_content comment.comment_body
  end
end
