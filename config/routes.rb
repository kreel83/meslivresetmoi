Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'books/search', to: 'searchs#index', as: :search
  get 'books/store', to: 'searchs#store', as: :store
  get 'books/index', to: 'books#index'
  get 'books/show/:id', to: 'books#show', as: :book_show
  get 'books/destroy/:id', to: 'books#destroy', as: :book_destroy
  patch 'books/update/:id', to: 'books#update', as: :book_update
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
