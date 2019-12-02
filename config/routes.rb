Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'books/search', to: 'searchs#index', as: :search
  get 'books/store', to: 'searchs#store', as: :store
  get 'books/index', to: 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
