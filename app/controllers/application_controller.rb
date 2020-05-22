class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    def authenticate_user!
        :current_auth_resource
    end
    def current_auth_resource
        if manager_signed_in?
          current_manager
        else
          current_employee
        end
      end
    
    def current_ability
        @current_ability or @current_ability = Ability.new(current_auth_resource)
    end
    #load_and_authorize_resource
end
