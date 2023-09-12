class Admin::OrdersController < Admin::BaseController

  def index
    @orders = UserProduct.all
  end

  def show
    @order ||= UserProduct.find(params[:id])
  end
end
