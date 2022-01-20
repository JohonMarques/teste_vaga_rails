class RelatedProduct < ApplicationRecord
  belongs_to :product
  with_options presence: true do
    validates :name, uniqueness: true
    validates :price
  end
end
