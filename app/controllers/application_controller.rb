class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_render_cart
    before_action :initialize_cart
    before_action :load_paystack

    def set_render_cart
        @render_cart = true
    end

    def initialize_cart
        @cart ||= Cart.find_by(id: session[:cart_id])

        if @cart.nil?
            @cart = Cart.create
            session[:cart_id] = @cart.id
        end
    end

    def load_paystack
        @paystack = Paystack.new(Rails.application.credentials[:paystack][:PAYSTACK_PUBLIC_KEY], Rails.application.credentials[:paystack][:PAYSTACK_PRIVATE_KEY])
    end

    private

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :surname, :address_line_1, :address_line_2, :phone_number, :avatar])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :surname, :address_line_1, :address_line_2, :phone_number, :avatar])
    end
end
