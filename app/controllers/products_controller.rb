class ProductsController < ApplicationController
    before_action :set_categories, only: %w[index show]

    def index
        @products = Product.ordered.where(archive: false)
    end

    def show
        @product ||= Product.find(params[:id])
        @products = Product.all.take(3)
        @related_products = Product.find(Product.pluck(:id).sample(3))
        # count = Product.count
        # random_offset = rand(3)
        # random_product = Product.offset(random_offset).first
    end

    private

        def set_categories
            @categories = Category.all
        end
end
