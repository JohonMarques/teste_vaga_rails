json.partial! 'products/product', product: @product

json.related_products @product.related_products do |product|
    json.id product.id
    json.name product.name
    json.price product.price
end
