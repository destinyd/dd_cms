DdCms::Engine.routes.draw do
  root 'home#index'
  
  scope path: '/kindeditor', as: 'kindeditor' do
    post "/upload" => "assets#create"
    get  "/filemanager" => "assets#list"
  end

  post '/permlink' => 'home#permlink'

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
