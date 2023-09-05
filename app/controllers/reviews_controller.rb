class ReviewsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
    before_action :find_product
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    before_action :restrict_other_users, only: %w[edit update destroy]

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
                format.html { redirect_to @product, notice: 'Review was successfully created.'}
                format.turbo_stream { flash.now[:notice] = 'Review was successfully created.' }
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
                format.html { redirect_to @product, notice: "Review was successfully updated." }
                format.turbo_stream { flash.now[notice:] = "Review was successfully updated." }
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @review.destroy
        respond_to do |format|
            format.html { redirect_to @product, class: "Review deleted." }
            format.turbo_stream { flash.now[:notice] = "Review deleted." }
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

        def restrict_other_users
            unless current_user == @review.user
                redirect_to @product, notice: 'Accedd denied!'
            end
        end
end
