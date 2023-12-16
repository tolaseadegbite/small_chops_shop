class Admin::BannersController < Admin::BaseController
   before_action :find_banner, only: %w[show edit update destroy]
    before_action :authenticate_user!

    def index
        @banners = Banner.order(id: :desc).where(["label LIKE ?","%#{params[:search]}%"])
    end
    
    def new
       @banner = Banner.new
    end
    
    def show
    end
    
    def create
        @banner = current_user.banners.build(banner_params)
        if @banner.save
            respond_to do |format|
                format.html { redirect_to admin_banners_url(@banner) }
            end
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def edit
        
    end

    def update
        if @banner.update(banner_params)
            respond_to do |format|
                format.html { redirect_to admin_banner_url(@banner), notice: "Banner updated." }
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        if @banner.destroy
            respond_to do |format|
                format.html { redirect_to admin_banners_url }
            end
        end
    end

    private

        def banner_params
            params.require(:banner).permit(:label, :image)
        end

        def find_banner
            @banner ||= Banner.find(params[:id])
        end
end
