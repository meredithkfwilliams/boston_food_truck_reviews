require 'rails_helper'

describe Location do
  it { should validate_presence_of(:location_name) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:latitude) }
  it { should have_many(:vendor_location_schedules) }
  it { should have_many(:vendors) }
end
