Weinkeller::Application.routes.draw do
  root 'weinkeller#index'

  resources :weinkeller do
    get :overview
    get :details
  end

  resources :users do
    get :logout
  end

  get 'logout', to: 'users#logout', as: :logout
end
