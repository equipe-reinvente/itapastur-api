Rails.application.routes.draw do
  # users
  resource :users, only: [:create]
  post "/login", to: "users#login"
  # enterprises
  get "/entreprises/:user_id", to: "enterprises#user_enterprises"
  get "/enterprise/:enterprise_id", to: "enterprises#enterprise"
  post "/enterprises", to: "enterprises#create"
  # events
  post "/events", to: "events#create"
  # comments
  post "/comments", to: "comments#create"
  # favorites
  post "/like", to: "favorites#like"
end
