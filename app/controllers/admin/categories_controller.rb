class Admin::CategoriesController < Admin::BaseController
    before_action :find_category, only: %w[show edit update destroy]
    before_action :authenticate_user!
    before_action :find_banners
 
     def index
         @categories = Category.ordered
     end
     
     def new
        @category = Category.new
     end
     
     def show
     end
     
     def create
         @category = current_user.categories.build(category_params)
         if @category.save
             respond_to do |format|
                format.html { redirect_to admin_categories_url(@category) }
             end
         else
            render :new, status: :unprocessable_entity
         end
     end
     
     def edit
         
     end
 
     def update
         if @category.update(category_params)
             respond_to do |format|
                format.html { redirect_to admin_category_url(@category) }
             end
         else
             render :edit, status: :unprocessable_entity
         end
     end
 
     def destroy
         if @category.destroy
             respond_to do |format|
                 format.html { redirect_to admin_categories_url }
             end
         end
     end
 
     private
 
         def category_params
             params.require(:category).permit(:name, :banner_id)
         end
 
         def find_category
             @category ||= Category.find(params[:id])
         end

         def find_banners
            @banners = Banner.all.order(:label)
         end
 end
 