class SessionController < ApplicationController

    def login

        if !params[:login]
            redirect_to "/"
            return
        end

        user = User.find_by(login: params[:login].downcase)
        if user && user.auth(params[:password]) then
            user.regenerate_token
            cookies[:token] = user.token

            redirect_to "/"
        else
            flash[:warning] = "Wrong combination"
            redirect_to "/login"
        end
    end

    def logoff 
        user = User.find_by(token: cookies[:token])
        if user
            user.token = ""
        end
        cookies[:token] = nil
        redirect_to "/"
    end
end
