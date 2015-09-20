DdCms::Engine.routes.draw do
  root 'home#index'

  resources :navs do
    member do
      put :move_up
      put :move_down
    end
  end

  resources :categories, :shallow => true do
    member do
      put :move_up
      put :move_down
    end
    resource :posts, :shallow => true
  end

  resources :pages
  resources :posts, :shallow => true
end
