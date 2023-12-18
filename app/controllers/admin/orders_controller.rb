class Admin::OrdersController < Admin::BaseController

  def index
    @orders = UserProduct.order(id: :desc).where(["transaction_id LIKE ?","%#{params[:search]}%"])
  end

  def show
    @order ||= UserProduct.find(params[:id])
  end
end
