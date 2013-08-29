ClubeDeAutores::Application.routes.draw do

  root :to => "index#index"
  match "index" => "index#index"
  match "entrar" => "login#login"
  match "sair" => "login#logout"
  match "nova_historia" => "histories#new"
  match "admin_home" => "admin#home"
  match "home" => "home#home"
  match "histories/rate" => "histories#rate"
  match "histories/favoriteChecked" => "histories#favoriteChecked"
  # match "/:redirect" => "index#index"

  resources :favorites, except:[:index, :edit, :new, :show]
  resources :classifications
  resources :contacts
  resources :rules, except:[:edit, :new, :index]
  resources :histories, except:[:index]
  resources :admin_home
  resources :users, except:[:index]

  resources :categories, except:[:index, :edit, :new, :destroy, :show] do
    member do
      get "histories"
      get "allcategories"
    end
  end  
  
  namespace :admin do
    resources :histories, only:[:index, :destroy]
    resources :rules, only:[:update, :edit]
    resources :categories
    resources :users
    match "admin/users" => "admin#users"
  end

  get "admin/home"
  get "all/categories"
  get "all/histories"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
