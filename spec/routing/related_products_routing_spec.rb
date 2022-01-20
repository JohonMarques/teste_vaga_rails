require 'rails_helper'

RSpec.describe RelatedProductsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/products/1/related_products').to route_to('related_products#index', product_id: '1', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/products/1/related_products/2').to route_to('related_products#show', product_id: '1', id: '2', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/products/1/related_products').to route_to('related_products#create', product_id: '1', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/products/1/related_products/2').to route_to('related_products#update', product_id: '1', id: '2', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/products/1/related_products/2').to route_to('related_products#update', product_id: '1', id: '2', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/products/1/related_products/2').to route_to('related_products#destroy', product_id: '1', id: '2', format: :json)
    end
  end
end
