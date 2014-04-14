Informaticacomp::Application.routes.draw do
  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'signup' => 'users#new', :as => :signup
  get 'logout' => 'sessions#destroy', :as => :logout
  get 'login' => 'sessions#new', :as => :login
  post 'add_to_home'=> 'products#add_to_home'
  post 'delete_from_home'=> 'products#delete_from_home'
  get 'view_product' => 'products#view_product'
  get 'products_home' => 'products#products_home'
  post 'products_home' => 'products#products_home'

  get 'income' => 'products#income'
  post 'income' => 'products#income'

  get '/income/index'=> 'income#index'
  #get '/order/new'=> 'order#new'

  
  get 'edit_to_home' => 'products#edit_to_home'
  post 'edit_to_home' => 'products#edit_to_home'
  get 'agregar_subproducto_venta' => 'subproducts#agregar_subproducto_venta'
  post 'agregar_subproducto_venta' => 'subproducts#agregar_subproducto_venta'
  get 'eliminar_subproducto_venta' => 'subproducts#eliminar_subproducto_venta'
  post 'eliminar_subproducto_venta' => 'subproducts#eliminar_subproducto_venta'
  get 'confirm_sale' => 'sales#confirm_sale'
  post 'confirm_sale' => 'sales#confirm_sale'

  get 'cancel_sale' => 'sales#cancel_sale'
  post 'cancel_sale' => 'sales#cancel_sale'

  get 'products/search' => 'products#search'
  get 'sales/search' => 'sales#search'
  get 'sales/searchProduct' => 'sales#searchProduct'

  get 'sales/daily_report' => 'sales#daily_report'
  get 'sales/weekly_report' => 'sales#weekly_report'
  get 'sales/monthly_report' => 'sales#monthly_report'
  get 'sales/anual_report' => 'sales#anual_report'

  root  'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  resources :products do    
    resources :subproducts
  end

  resources :products do
  resources :incomes
end

  resources :sales
  resources :sessions
  resources :users
  resources :incomes
  resources :orders

  #resources :sales do
   # resources :subproducts
  #end

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
