class WishlistsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_product, only: [:create, :destroy]
    before_action :restrict_other_users, only: %w[destroy]

    def index
        @products = current_user.wishlisted_products.order(id: :desc)
    end

    def create
        @wishlist = @product.wishlists.create(wishlist_params)
        @wishlist.user = current_user
        if @wishlist.save
            respond_to do |format|
                format.html { redirect_to @wishlist.product, notice: "Added to wishlist." }
                format.turbo_stream { flash.now[:notice] = 'Added to wishlist.' }
            end
        else
            flash[:notice] = @wishlist.errors.full_messages.to_sentence
        end
    end

    def destroy
        @wishlist = current_user.wishlists.find(params[:id])
        @wishlist.destroy
        respond_to do |format|
            format.html { redirect_to @product, notice: "Removed from wishlist." }
            format.turbo_stream { flash.now[:notice] = 'Removed from wishlist.' }
        end
    end

    private

    def wishlist_params
        params.require(:wishlist).permit(:product_id)
    end

    def set_product
        @product ||= Product.find(params[:product_id])
    end

    # redirect unauthorised wishlist deletion
    def restrict_other_users
        @wishlist ||= Wishlist.find(params[:id])
        redirect_to(@product, status: :see_other, notice: 'Access denied') unless current_user == @wishlist.user
    end
end
