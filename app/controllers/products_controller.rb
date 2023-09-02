class ProductsController < ApplicationController

    def index
        @products = Product.ordered
    end

    def show
        @product ||= Product.find(params[:id])
        @products = Product.all.take(3)
        @related_products = Product.find(Product.pluck(:id).sample(3))
        # count = Product.count
        # random_offset = rand(3)
        # random_product = Product.offset(random_offset).first
    end
end
