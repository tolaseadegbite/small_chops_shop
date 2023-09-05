class ReviewsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
    before_action :find_product
    before_action :find_review, only: [:show, :edit, :update, :destroy]

    def index
        @reviews = @product.reviews
    end

    def show
        
    end

    def new
        @review = Review.new
    end

    def create
        @review = @product.reviews.build(review_params)
        @review.user = current_user
        if @review.save
            respond_to do |format|
                format.html { redirect_to product_path(@product), notice: 'Review was successfully created.'}
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        
    end

    def update
        if @review.update(review_params)
            respond_to do |format|
                format.html { redirect_to product_path(@product), notice: "Review was successfully updated." }
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @review.destroy
        respond_to do |format|
            format.html { redirect_to product_path(@product), class: "Review deleted." }
        end
    end

    private

        def review_params
            params.require(:review).permit(:title, :rating, :body, :product_id, :user_id)
        end

        def find_review
            @review ||= Review.find(params[:id])
        end

        def find_product
            @product ||= Product.find(params[:product_id])
        end
end
