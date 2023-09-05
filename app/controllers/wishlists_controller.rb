class WishlistsController < ApplicationController
    before_action :authenticate_user!

    def create
        @wishlist = current_user.wishlists.create(wishlist_params)
        if @wishlist.save
            respond_to do |format|
                format.html { redirect_back(fallback_location: @wishlist.product) }
            end
        else
            flash[:notice] = @wishlist.errors.full_messages.to_sentence
        end
    end

    def destroy
        @wishlist = product.wishlists.find(params[:id])
        @wishlist.destroy
        redirect_to @product
    end

    private

    def wishlist_params
        params.require(:wishlist).permit(:product_id)
    end

    def product
        @product ||= Product.find(params[:product_id])
    end
end
