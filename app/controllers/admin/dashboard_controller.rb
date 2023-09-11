class Admin::DashboardController < Admin::BaseController
  def index
    transactions = PaystackTransactions.new(@paystack)
    result = transactions.totals()
    @total_earnings = result['data']['total_volume']
    @total_transactions = result['data']['total_transactions']
    @products_in_stock = Product.sum(&:stock)
  end
end
