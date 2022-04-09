Rails.application.routes.draw do
  resources :books
  ##質問
  # resources :users,only:[:index,:show]
  resources :users,only:[:index]
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => "homes#about",as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
