require 'rails_helper'

describe Category do
  it { should validate_presence_of(:category_name) }
  it { should have_many(:vendor_categories) }
  it { should have_many(:vendors) }
end
