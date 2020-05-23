class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, 
      :email])
      #in keys you list all the input you want to accept.
    end
    def authenticate_user!
        :current_auth_resource
    end
    def after_sign_in_path_for(resource)
      stored_location_for(resource) || expenses_path
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
