class CheckoutController < ApplicationController
    
    def create
        total_amount = @cart.total
        # cart_items = @cart.products.pluck(:name).join(", ")
        cart_items = @cart.products.pluck(:name)
        reference = "#{@cart.products.pluck(:id).join().to_i}_#{rand.to_s[2..10]}"
        callback_url = checkout_success_url
        cancel_url = checkout_failure_url

        @payment = PaystackTransactions.new(PAYSTACKOBJ)

        @result = @payment.initializeTransaction(
            :reference => reference,
            :amount => total_amount * 100,
            :email => current_user.email,
            callback_url: callback_url,
            channels: ["card"],
            metadata: {
                cancel_action: cancel_url,
                payment_medium: "Website",
                custom_fields: [
                    {
                        "display_name": "Cart Items",
                        "variable_name": "Cart Items",
                        "value": cart_items
                    }
                ]
            }
        )
        auth_url = @result['data']['authorization_url']
        respond_to do |format|
            format.html { redirect_to auth_url, allow_other_host: true, status: :see_other }
        end
    end

    def success
        if params[:reference].present?
            session[:cart_id] = [] # empty array cart = empty array

            transaction_reference = params[:reference]

            @transaction_result = PaystackTransactions.verify(@paystack, transaction_reference)

            @cart_items = @transaction_result['data']['metadata']['custom_fields']
        else
            redirect_to checkout_failure_url, alert: "No info for you here."
        end
    end
end