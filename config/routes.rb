Rails.application.routes.draw do
  
  root :to =>"public#index"
  get 'teacher' ,:to=>'access#menu'
  get 'show/:permalink', :to=>'public#show'   ,:as=>'public_show'
  get 'access/menu'
  get 'access/login', to: 'access#login', as: 'access_login'
  post 'access/attempt_login'
  get 'access/logout'



resources :teachers do
  member do
    get :delete
  end
end

  resources :colleges do
  member do
    get :delete
  end
 end

 resources :students do
  member do
    get :delete
 end
end
    
resources :books do
  member do
    get :delete 
  end
  end

  
  
  
end
