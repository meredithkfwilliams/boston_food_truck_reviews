require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  #it {should have_many(:dogs)}
  #it {should have_many(:corporation)}
  #it {should belong_to(:owners)}

  # it { should validate_presence_of(:name) }
  # it { should have_many(:dogs) }
  # it { should belong_to(:owner) }
end


describe Category do
  it { should validate_presence_of(:category_name) }
  it { should have_many(:vendor_categories) }
  it { should have_many(:vendors) }
end

describe Location do
  it { should validate_presence_of(:location_name) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:latitude) }
  it { should have_many(:vendor_location_schedules) }
  it { should have_many(:vendors) }
end

describe Review do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:vendor_id) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:body) }
  it { should belong_to(:user) }
  it { should belong_to(:vendor) }
end

describe Vendor do
  it { should validate_presence_of(:vendor_name) }
  it { should have_many(:reviews) }
  it { should have_many(:vendor_categories) }
  it { should have_many(:categories) }
  it { should have_many(:vendor_location_schedules) }
  it { should have_many(:locations) }
end

describe VendorCategory do
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:vendor_id) }
  it { should belong_to(:vendor) }
  it { should belong_to(:category) }
end

describe VendorLocationSchedule do
  it { should validate_presence_of(:vendor_id) }
  it { should validate_presence_of(:location_id) }
  it { should validate_presence_of(:weekday) }
  it { should belong_to(:vendor) }
  it { should belong_to(:location) }
end
