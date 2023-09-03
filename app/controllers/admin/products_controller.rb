class Admin::ProductsController < Admin::BaseController
    before_action :find_product, only: %w[show edit update destroy]
    before_action :authenticate_user!
    before_action :find_categories
    # before_action :find_category, only: :show

    def index
        @products = Product.ordered
    end
    
    def new
       @product = Product.new
    end
    
    def show
    end
    
    def create
        @product = current_user.products.build(product_params)
        if @product.save
            respond_to do |format|
                format.html { redirect_to admin_products_url(@product), notice: "Product created." }
            end
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def edit
        
    end

    def update
        if @product.update(product_params)
            respond_to do |format|
                format.html { redirect_to admin_product_url(@product), notice: "Product updated." }
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        if @product.destroy
            respond_to do |format|
                format.html { redirect_to admin_products_url, notice: "Product destroyed." }
            end
        end
    end

    private

        def product_params
            params.require(:product).permit(:name, :description, :unit_price, :code, :stock, :image, :feature, :archive, :category_id)
        end

        def find_product
            @product ||= Product.find(params[:id])
        end

        def find_categories
            @categories = Category.all.order(:name)
        end

        def find_category
            @category ||= @product.category.find(params[:category_id])
        end
end
