require 'rails_helper'

RSpec.describe User, type: :model do

  let!(:admin) { FactoryGirl.create(:user, user_type: 'Admin') }
  let!(:member) { FactoryGirl.create(:user, user_type: 'Member') }
  let!(:vendor) { FactoryGirl.create(:user, user_type: 'Vendor') }

  it "should correctly identify an admin user" do
    expect(admin.admin?).to be true
    expect(admin.member?).to be false
    expect(admin.vendor?).to be false
  end

  it "should correctly identify an member user" do
    expect(member.admin?).to be false
    expect(member.member?).to be true
    expect(member.vendor?).to be false
  end

  it "should correctly identify an vendor user" do
    expect(vendor.admin?).to be false
    expect(vendor.member?).to be false
    expect(vendor.vendor?).to be true
  end
end
