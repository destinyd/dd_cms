Rails.application.routes.draw do
  mount DdCms::Engine => '/', :as => 'dd_cms'
  mount PlayAuth::Engine => '/auth', :as => :auth
end
