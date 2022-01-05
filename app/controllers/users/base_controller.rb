class AuthorizeController < ApplicationController 
    before_action :require_user
    
    def require_user
        if !current_user
            flash[:alert] = "you must be registered and logged in to access this page"
            redirect_to root_path
        end 
    end 
end 