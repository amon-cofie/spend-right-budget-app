Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: [:index, :new, :create] do 
    resources :expenses, only: [:index, :new, :create]
  end
  # resources :category_expenses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "splash_screen#index"
end
