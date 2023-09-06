class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    private

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :surname, :address_line_1, :address_line_2, :phone_number])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :surname, :address_line_1, :address_line_2, :phone_number])
    end
end
