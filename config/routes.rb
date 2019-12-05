Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'books/search', to: 'searchs#index', as: :search
  get 'books/store', to: 'searchs#store', as: :store
  get 'books/index', to: 'books#index'
  get 'books/show/:id', to: 'books#show', as: :book_show
  get 'books/destroy/:id', to: 'books#destroy', as: :book_destroy
  patch 'books/:id/update', to: 'books#update', as: :book_update
  post 'books/:id/notation', to: 'books#update_notation', as: :post_notation
  post 'books/:id/tags', to: 'books#update_tag', as: :book_update_tag, defaults: {format: :json}

  get 'books/:id/notations', to: "notations#index", as: :notations
  get 'books/:id/reviews', to: "reviews#index", as: :reviews
  get 'books/:id/consultReviews', to: "reviews#consult", as: :review_consult
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
