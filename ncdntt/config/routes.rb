Rails.application.routes.draw do
  devise_for :users
  resources :incidents do
      member do
      get :close
      patch :update_close
    end
  end
  root "incidents#index"
  get '/show_mine', to: 'incidents#show_mine'

# 
# API ROUTES
# 
# INCIDENTS 
  # GET ALL
  get 'api/getincidents', to: 'api#getIncidents'
  # GET ONE
  get 'api/getincident', to: 'api#getIncident'

# CREATE
  post 'api/createincident', to: 'api#createIncident'
# UPDATE
  post 'api/updateincident', to: 'api#updateIncident'
# CLOSE
  post 'api/closeincident', to: 'api#closeIncident'
# DELETE
  post 'api/deleteincident', to: 'api#deleteIncident'


# USERS

# CREATE 
  post 'api/createuser', to: 'api#createUser'
# GET ALL
  get 'api/getusers', to: 'api#getUsers'

# CATEGEORIES 

# GET ALL
  get 'api/getcategories', to: 'api#getCategories'

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
