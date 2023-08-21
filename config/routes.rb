Rails.application.routes.draw do
  resource :users, only: [:create]
  resource :enterprises
  post "/login", to: "users#login"
end
