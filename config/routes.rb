Rails.application.routes.draw do
  resource :books, only: [:new, :index :show :edit]
  devise_for :users
  root to: 'homes#top'
  get 'homes/about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
