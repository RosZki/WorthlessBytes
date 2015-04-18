Rails.application.routes.draw do
  get 'user/index'

  get 'user/new'

  get 'user/create'

  get 'user/update'

  get 'users/index'

  get 'users/new'

  get 'users/create'

  get 'users/update'

  get 'screenshots/index'

  get 'screenshots/new'

  get 'screenshots/create'

  get 'screenshots/destroy'

  get 'review_ratings/index'

  get 'review_ratings/new'

  get 'review_ratings/create'

  get 'review_ratings/destroy'

  get 'game_reviews/index'

  get 'game_reviews/new'

  get 'game_reviews/create'

  get 'game_reviews/destroy'

  get 'games/index'

  get 'games/new'

  get 'games/create'

  get 'games/destroy'
  
  root 'application#home'
  
  get 'register' => 'sessions#register_page'
  post 'register' => 'sessions#register'
  post 'login' => 'sessions#login'
  get 'logout' => 'sessions#logout'
  
  get 'game_list' => 'application#game_list'
  get 'game' => 'application#game'
  get 'admin' => 'application#admin'
  
  post 'search' => 'application#search'
  get 'profile' => 'application#profile'
  
  get 'visit_profile' => 'application#visit_profile'
  
  
  resources :user, only: [:index, :new, :create, :destroy, :update]
  resources :games, only: [:index, :new, :create, :destroy]
  resources :game_reviews, only: [:index, :new, :create, :destroy]
  resources :review_ratings, only: [:index, :new, :create, :destroy]
  
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
