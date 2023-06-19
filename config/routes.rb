Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/uitest", to: "pages#uitest"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/my_applications", to: "property_applications#my_applications", as: :my_applications
  resources :properties do
    resources :property_applications, only: [:index, :new, :create] do
      member do
        patch :accept
        patch :decline
      end
    end
    resources :property_application_finalize # , only: []
  end

  resources :property_applications, only: [:index, :show, :edit, :update, :destroy] do
    resources :bank_references, only: [:index, :new, :create] do
      collection do
        get :tenant_index
      end
    end
    resources :employment_documents, only: [:index, :new, :create, :edit ] do
      collection do
        get :tenant_index
      end
    end
    resources :identifications, only: [:index, :new, :create] do
      collection do
        get :tenant_index
      end
    end
    resources :messages
  end
  resources :identifications, only: [:show, :edit, :update, :destroy]
  resources :employment_documents, only:[:destroy, :show, :edit, :update]
  resources :bank_references, only:[:destroy, :show, :edit, :update]
end
