class WishlistsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_product

    def create
        @wishlist = current_user.wishlists.create(wishlist_params)
        if @wishlist.save
            respond_to do |format|
                format.html { redirect_to @product, notice: "Added to wishlist." }
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
end
