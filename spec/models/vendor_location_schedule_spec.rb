require 'rails_helper'

describe VendorLocationSchedule do
  it { should validate_presence_of(:vendor_id) }
  it { should validate_presence_of(:location_id) }
  it { should validate_presence_of(:weekday) }
  it { should belong_to(:vendor) }
  it { should belong_to(:location) }
end
