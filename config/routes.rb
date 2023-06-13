Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :properties do
    resources :property_applications, only: [:index, :new, :create] do
      resources :bank_references, only: [:new, :show, :create, :edit]
      resources :employment_references, only: [:new, :show, :create, :edit]
      resources :identificiations, only: [:new, :show, :create, :edit]
      resources :messages
    end
  end

  resources :property_applications, only: [:show, :edit, :update]

  # Defines the root path route ("/")
  # root "articles#index"
end
