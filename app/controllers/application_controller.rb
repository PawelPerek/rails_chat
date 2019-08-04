class ApplicationController < ActionController::Base
    def redirect
        user = User.find_by(token: cookies[:token])

        if user
            redirect_to "/chat"
        else
            redirect_to "/index"
        end
    end
end
