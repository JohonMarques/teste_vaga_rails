FactoryBot.define do
  factory :related_product do
    product { Product.first || association(:product) }
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
  end
end
