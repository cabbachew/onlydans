Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  # Define routes to create, update, and destroy friendships
  post "/friendships", to: "friendships#create", as: "create_friendship"
  put "/friendships", to: "friendships#update", as: "update_friendship"
  delete "/friendships", to: "friendships#destroy", as: "destroy_friendship"

  # Define routes for posts and comments
  # resources :posts do
  #   resources :comments, shallow: true do
  #     resources :comments, shallow: true
  #   end
  # end

  resources :posts, :comments, :likes

  # Define route for user profile
  get "/profile/:id", to: "pages#profile", as: "profile"

  # Define the root route
  root "pages#index"
end
