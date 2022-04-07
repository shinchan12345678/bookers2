Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
