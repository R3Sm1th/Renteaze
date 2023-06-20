Rails.application.routes.draw do
  get 'flats/index'
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
  end
  resources :chatrooms, only: :show do
    resources :messages, only: :create
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
    resources :property_application_finalize, only: [:index]

    member do
      get :finalize
      patch :set_move_in
    end
  end
  resources :identifications, only: [:show, :edit, :update, :destroy] do
    member do
      get :download_pdf
    end
  end
  resources :employment_documents, only:[:destroy, :show, :edit, :update] do
    member do
      get :download_pdf
    end
  end
  resources :bank_references, only:[:destroy, :show, :edit, :update] do
    member do
      get :download_pdf
    end
  end
end
