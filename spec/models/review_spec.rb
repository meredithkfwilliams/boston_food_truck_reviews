require 'rails_helper'

describe Review do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:vendor_id) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:body) }
  it { should belong_to(:user) }
  it { should belong_to(:vendor) }
end
