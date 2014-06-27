Weinkeller::Application.routes.draw do
  root 'application#index'

  resources :cellars do
    get :overview
    get :details, to: 'cellars#details', as: :details
    post 'create' => "cellars#create"
  end

  resources :users do
    get :logout
  end

  get 'logout', to: 'users#logout', as: :logout
end
