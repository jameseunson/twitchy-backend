Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'index#index'

  namespace :api do
    resources :code, only: [:create]
    match 'code/status/:id/:hash', :to => 'code#status', :as => :code_status, :via => :get    
  end

  match 'code', :to => 'index#code', :as => :code, :via => :get
  match 'code/process', :to => 'index#process_code', :as => :process_code, :via => :post  
  match 'code/error', :to => 'index#code_error', :as => :code_error, :via => :get  
  match 'code/token', :to => 'index#code_token', :as => :code_token, :via => :get
  
  match 'code/token/save', :to => 'index#code_token_save', :as => :code_token_save, :via => :post  
  match 'code/token/error', :to => 'index#code_token_error', :as => :code_token_error, :via => :get    

  match 'code/token/done', :to => 'index#code_token_done', :as => :code_token_done, :via => :get      

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
