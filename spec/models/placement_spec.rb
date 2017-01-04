require 'rails_helper'

RSpec.describe Placement, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:address) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:photos) }
end
