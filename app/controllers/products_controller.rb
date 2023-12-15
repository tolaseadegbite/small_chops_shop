class ProductsController < ApplicationController
    before_action :set_categories, only: %w[index show]

    def index
        @products = Product.ordered.where(archive: false)
    end

    def show
        @product ||= Product.find(params[:id])
        @related_products = @product.category.products.where.not(id: @product.id).take(3)
        # @related_products = Product.find(Product.pluck(:id).sample(3))
        @reviews = @product.reviews.includes(:user)
    end

    def purchased_products
        @products = current_user.purchased_products
    end

    private

        def set_categories
            @categories = Category.all
        end
end
