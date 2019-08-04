class ChatController < ApplicationController
  def room
    user = User.find_by(token: cookies[:token])

    if !user 
      redirect_to "/"
    end
  end
end
