require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
    def setup
      @admin = users(:tolase)
      @non_admin = users(:jane)
      
    end
end
