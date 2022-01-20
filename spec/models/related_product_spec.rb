require 'rails_helper'

RSpec.describe RelatedProduct, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:price) }
end
