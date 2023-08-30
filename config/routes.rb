Rails.application.routes.draw do
  # users
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/view_user/:user_id", to: "users#view_user"
  put "/user/:user_id", to: "users#update"
  delete "/user/:user_id", to: "users#destroy"
  # categories
  post "/categories", to: "categories#create"
  # enterprises
  post "/enterprises", to: "enterprises#create"
  get "/categories/enterprises", to: "enterprises#enterprises_by_category"
  get "/enterprises/:user_id", to: "enterprises#user_enterprises"
  put "/enterprises/:enterprise_id", to: "enterprises#edit_enterprise"
  delete "/enterprises/:enterprise_id", to: "enterprises#destroy_enterprise"

  # events
  post "/events", to: "events#create"
  get "/events", to: "events#get_events"
  # comments
  post "/comments", to: "comments#create"
  get "/enterprise/:enterprise_id/comments", to: "comments#get_enterprise_comments"
  patch "/comments/:comment_id", to: "comments#update_comment"
  delete "/comments/:comment_id", to: "comments#destroy_comment"
  # favorites
  post "/like", to: "favorites#like"
  get "/likes/:user_id", to: "favorites#user_likes"
  # token healthy check
  get "/healthy_token", to: "application#authorize"
  # utils comands because fly.io stops when run in terminal :(
  post "utils/seed", to: "utils#seed_database"

  get "/forward/:enterprise_id", to: "utils#forward"
end
