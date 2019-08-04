class LoginController < ApplicationController

    def index 
        user = User.find_by(token: cookies[:token])

        if user
            redirect_to "/chat"
        end

        @name = "guest"
    end

    def login
        user = User.find_by(token: cookies[:token])

        if user
            redirect_to "/chat"
        end
    end

    def register

        user = User.find_by(token: cookies[:token])

        if user
            redirect_to "/chat"
        end
        
    end

    def create
        dup = User.find_by(login: params[:login].downcase)

        if dup then
            flash[:warning] = "There is already a user with this nickname"
            redirect_to "/register"
            return
        end

        @user = User.new(params.permit(:login, :password))
        
        @user.save!
        flash[:success] = "Successfully registered"
        redirect_to "/"
    end

    private def get_name(token)
        user = User.find_by(token: token)
        user ? user.login : false
    end
end
