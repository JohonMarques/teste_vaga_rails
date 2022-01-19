class Product < ApplicationRecord
  has_many :related_products, dependent: :destroy
  with_options presence: true do
    validates :name, uniqueness: true
    validates :description
    validates :price
    validates :quantity
  end
end
