DdCms::Engine.routes.draw do
  root 'home#index'

  resources :navs do
    member do
      put :move_up
      put :move_down
    end
  end

  resources :categories do
    member do
      put :move_up
      put :move_down
    end
  end

  resources :pages
end
