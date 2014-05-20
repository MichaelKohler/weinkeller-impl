Weinkeller::Application.routes.draw do
  root 'weinkeller#index'

  resources :weinkeller do
    get :overview
    get :details
  end
end
