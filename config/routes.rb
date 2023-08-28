Rails.application.routes.draw do
  # users
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/view_user/:user_id", to: "users#view_user"
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
  # utils comands because fly.io stops when run in terminal :(
  post "utils/seed", to: "utils#seed_database"

  get "/forward/:enterprise_id", to: "utils#forward"
end
