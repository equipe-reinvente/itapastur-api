Rails.application.routes.draw do
  # users
  resource :users, only: [:create]
  post "/login", to: "users#login"
  # categories
  post "/categories", to: "categories#create"
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
  get "/likes/:user_id", to: "favorites#user_likes"
end
