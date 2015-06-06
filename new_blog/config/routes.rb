Rails.application.routes.draw do

  root 'posts#index'

  resources :posts do
    resources :comments
  end



  resources :users

  get '/login', to: 'sessions#new', as: 'new_login_session'
  delete '/logout', to: 'sessions#destroy', as: 'log_out'
  post '/login', to: 'sessions#create'

  get '/users/:id', to: 'users#show', as: 'users_page'

  get '/users', to: 'users#index', as: 'all_users'

  get '/signup', to: 'users#new', as: 'new_user_signup'


  get '/profilepage', to: 'users#profile_page', as: 'profile_page'


  post '/users/:friend_id/friendships', to: 'friendships#create', as: 'friendships'

  delete '/users/:friend_id/friendships', to: 'friendships#destroy', as: 'destroy_friend'


  patch '/users/:friend_id/friendships', to: 'friendships#accept_friend', as: 'accept_friendship'





  #post '/posts/:post_id/comments', to: 'comments#create', as: 'post_comments'

  #delete '/posts/:post_id/comments/:id', to: 'comments#destroy', as: 'post_comment'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
