Rails.application.routes.draw do
  # users
  resource :users, only: [:create]
  post "/login", to: "users#login"
  # categories
  post "/categories", to: "categories#create"
  # enterprises
  post "/enterprises", to: "enterprises#create"
  get "/categories/enterprises", to: "enterprises#enterprises_by_category"
  # events
  post "/events", to: "events#create"
  # comments
  post "/comments", to: "comments#create"
  # favorites
  post "/like", to: "favorites#like"
  get "/likes/:user_id", to: "favorites#user_likes"
  # token healthy check
  get "/healthy_token", to: "application#authorize"
end
