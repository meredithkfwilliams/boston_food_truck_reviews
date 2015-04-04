require 'rails_helper'

describe Vendor do
  it { should validate_presence_of(:vendor_name) }
  it { should have_many(:reviews) }
  it { should have_many(:vendor_categories) }
  it { should have_many(:categories) }
  it { should have_many(:vendor_location_schedules) }
  it { should have_many(:locations) }
end
