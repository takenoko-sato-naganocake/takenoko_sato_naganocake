Rails.application.routes.draw do
  # devise_for :admins
  # devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords,], controllers: {
    registrations: "customers/registrations",
    sessions: 'customers/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  root to: "homes#top"
  get "/about" => "homes#about"

  # 管理者
  namespace :admin do

    resources :products, except: [:destroy]
    resources :genres, except: [:show, :new, :destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]

  end

  #顧客
  scope module: :public do

    resource :customers, only: [:show, :edit, :update] do
      collection do
        get "unsubsclibe"
        patch "withdraw"
      end
    end

    resources :products, only: [:index, :show]
    resources :cart_products, except: [:new, :show, :edit] do
      collection do
        delete "destroy_all"
      end
    end

    resources :orders, except: [:update, :destroy, :edit] do
      collection do
        post "confirm"
        get "complete"
      end
    end
    resources :shippings, except: [:new, :show]
  end

end
