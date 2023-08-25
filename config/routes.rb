Rails.application.routes.draw do
  # users
  resource :users, only: [:create]
  post "/login", to: "users#login"
  # categories
  post "/categories", to: "categories#create"
  # enterprises
  post "/enterprises", to: "enterprises#create"
  get "/categories/enterprises", to: "enterprises#enterprises_by_category"
  get "/enterprises/:user_id", to: "enterprises#user_enterprises"
  # events
  post "/events", to: "events#create"
  # comments
  post "/comments", to: "comments#create"
  # favorites
  post "/like", to: "favorites#like"
  get "/likes/:user_id", to: "favorites#user_likes"
  # token healthy check
  get "/healthy_token", to: "application#authorize"

  post "utils/seed", to: "utils#seed_database"
end
