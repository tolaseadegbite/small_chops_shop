class Admin::BaseController < ApplicationController
    layout 'admin'
    # before_action :restrict_user_by_role

    # valid roles

    VALID_ROLES = ['Super Admin', 'Admin']

    protected

    # redirect if user not logged in or does not have a valid role
    def restrict_user_by_role
        unless current_user && VALID_ROLES.include?(current_user.role)
            redirect_to(root_url, notice: 'Access restricted!')
        end
    end
end