require 'rails_helper'

describe VendorCategory do
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:vendor_id) }
  it { should belong_to(:vendor) }
  it { should belong_to(:category) }
end
