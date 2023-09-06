class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :load_paystack

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :surname, :address_line_1, :address_line_2, :phone_number])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :surname, :address_line_1, :address_line_2, :phone_number])
    end

    def load_paystack
        @paystack = Paystack.new(Rails.application.credentials[:paystack][:PAYSTACK_PUBLIC_KEY], Rails.application.credentials[:paystack][:PAYSTACK_PRIVATE_KEY])
    end
end
