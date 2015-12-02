Rails.application.routes.draw do
  devise_for :users
 resources :pins
 get 'about'   => 'pages#about'
 get 'shop'    => 'pins#index'
 get 'contact' => 'pages#contact'
 post 'request_contact', to: 'pages#request_contact'
 
 root "pages#home"

end
