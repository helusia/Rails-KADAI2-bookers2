Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :books,only:[:destroy, :show, :index, :create, :edit, :update]
  resources :homes
  resources :users,only:[:index, :show, :edit, :update]
  get 'home/about' => 'homes#show',as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
