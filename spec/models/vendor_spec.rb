require 'rails_helper'

describe Vendor do

  let!(:vendor) { FactoryGirl.create(:user, user_type: 'Vendor') }

  it { should validate_presence_of(:vendor_name) }
  it { should have_many(:reviews) }
  it { should have_many(:vendor_categories) }
  it { should have_many(:categories) }
  it { should have_many(:vendor_location_schedules) }
  it { should have_many(:locations) }

  it "find a vendor object that matches search string" do
    expect(Vendor.search(vendor.vendor_name)).to be true
  end

end
