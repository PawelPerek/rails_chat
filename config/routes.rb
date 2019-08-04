Rails.application.routes.draw do

  root "application#redirect"
  
  get "index" => "login#index"
  get "login" => "login#login"
  get "register" => "login#register"
  post "register" => "login#create"
  post "login" => "session#login"
  get "logoff" => "session#logoff"
  get "chat" => "chat#room"

  mount ActionCable.server => "/ws"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
