class Admin::UsersController < Admin::BaseController
    before_action :find_user, only: %w[show edit update destroy]
    
    def index
        @users = User.order(id: :desc).where(["username LIKE ?","%#{params[:search]}%"])
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            respond_to do |format|
                format.html { redirect_to admin_user_url(@user), notice: "User created." }
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        
    end

    def update
        if @user.update(user_params)
            respond_to do |format|
                format.html { redirect_to admin_user_url(@user), notice: "User updated." }
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        if @user.destroy
            respond_to do |format|
                format.html { redirect_to admin_users_url, notice: "User deleted."}
            end
        end
    end

    private

        def user_params
            params.require(:user).permit(:first_name, :surname, :email, :address_line_1, :address_line_2, :role, :username)
        end

        def find_user
            @user ||= User.find(params[:id])
        end
end
