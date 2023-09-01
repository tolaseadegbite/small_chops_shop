class Admin::ProductsController < Admin::BaseController
    before_action :find_product, only: %w[show edit update destroy]

    def index
        @products = Product.ordered
    end
    
    def new
       @product = Product.new
    end
    
    def create
        @product = current_user.products.build(product_params)
        if @product.save
            respond_to do |format|
                format.html { redirect_to admin_product }
            end
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def edit
        
    end

    def show
    end

    def update
        if @product.update(product_params)
            respond_to do |format|
                format.html { redirect_to admin_product }
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        if @product.destroy(product_params)
            respond_to do |format|
                format.html { redirect_to admin_products }
            end
        end
    end

    private

        def product_params
            params.require(:product).permit(:name, :description, :unit_price, :code, :stock)
        end

        def find_product
            @product ||= Product.find(params[:id])
        end
end
