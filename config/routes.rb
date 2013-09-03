ClubeDeAutores::Application.routes.draw do

  resources :favorites, except:[:index, :edit, :new, :show]
  resources :classifications
  resources :contacts
  resources :rules, except:[:edit, :new, :index]
  resources :histories, except:[:index]
  resources :admin_home
  resources :users, except:[:index]

  resources :categories, except:[:index, :edit, :new, :destroy, :show] do
    member do
      get 'histories'
      get 'allcategories'
    end
  end  
  
  namespace :admin do
    resources :histories, only:[:index, :destroy]
    resources :rules, only:[:update, :edit]
    resources :categories
    resources :users
    match 'admin/users' => 'admin#users'
  end

  get 'admin/home'
  get 'all/categories'
  get 'all/histories'
  get 'all/pending'

  root :to => 'index#index'
  match 'index' => 'index#index'
  match 'entrar' => 'login#login'
  match 'sair' => 'login#logout'
  match 'nova_historia' => 'histories#new'
  match 'admin_home' => 'admin#home'
  match 'home' => 'home#home'
  match 'histories/rate' => 'histories#rate'
  match 'histories/favoriteChecked' => 'histories#favoriteChecked'
  match 'histories/:id/moderation' => 'histories#moderation'
  match '*a', to: 'errors#routing'
end
