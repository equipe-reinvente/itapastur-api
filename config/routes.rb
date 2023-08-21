Rails.application.routes.draw do
  resource :users, only: [:create]
  get "/entreprises/:user_id", to: "enterprises#user_enterprises"
  get "/enterprise/:enterprise_id", to: "enterprises#enterprise"
  post "/enterprises", to: "enterprises#create"
  post "/login", to: "users#login"
end
