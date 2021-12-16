class SessionsController < ApplicationController
    def new 

    end 

    def create 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            redirect_to '/search'
        else 
            redirect_to '/login'
        end 
    end 
end     