Rails.application.routes.draw do
  resources :books
  devise_for :users
  ##質問
  resources :users,only:[:index,:show,:edit,:update]
  # resources :users,only:[:index]
  root to: 'homes#top'
  get 'home/about' => "homes#about",as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
