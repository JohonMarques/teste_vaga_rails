class RelatedProductsController < ApplicationController
  before_action :set_related_product, only: %i[show update destroy]

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { errors: [error.message] }, status: :not_found
  end

  def index
    @related_products = RelatedProduct.all
  end

  def show; end

  def create
    product = Product.find_by_id(params[:related_product_id])

    unless params[:related_product_id].to_i === params[:product_id].to_i
      @related_product = RelatedProduct.new(name: product.name, price: product.price, product_id: params[:product_id])

      if @related_product.save
        render :show, status: :created, location: product_related_products_path
      else
        render json: { errors:@related_product.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "Erro, não é possivel relacionar um produto a ele mesmo" }, status: :unprocessable_entity

    end



  end

  def update
    if@related_product.update(related_product_params)
      render :show, status: :ok, location: product_related_products_path
    else
      render json: { errors: @related_product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @related_product.destroy
  end

  private

  def set_related_product
    @related_product = RelatedProduct.find(params[:id])
  end

  def related_product_params
    params.require(:related_product).permit(:name, :price, :product_id)
  end
end
