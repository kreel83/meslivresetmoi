Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'books/search', to: 'searchs#index', as: :search
  get 'books/store', to: 'searchs#store', as: :store
  get 'books/index', to: 'books#index', as: :books
  get 'books/:id/show', to: 'books#show', as: :book_show
  get 'books/liste/:id/show', to: 'listes#show', as: :liste_show
  patch 'books/liste/:id/update', to: 'listes#update', as: :liste_update

  patch 'books/:id/update', to: 'books#update', as: :book_update
  delete 'books/:id/destroy', to: 'books#destroy', as: :book_destroy
  post 'books/:id/notation', to: 'books#update_notation', as: :post_notation
  post 'books/:id/tags', to: 'books#update_tag', as: :book_update_tag, defaults: {format: :json}

  get 'books/:id/notations', to: "notations#index", as: :notations
  get 'books/:id/reviews/new', to: "reviews#new", as: :new_review
  post 'books/:id/reviews/new', to: "reviews#create"
  delete 'books/:id/reviews/:id', to: "reviews#destroy"
  get 'books/:id/reviews', to: "reviews#index", as: :reviews
  get 'books/:id/consultReviews', to: "reviews#consult", as: :review_consult
  get 'books/:id/consultNotations', to: "notations#consult", as: :notation_consult
  get 'books/:user/profil', to: "profils#show", as: :profil_show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "books/:id/comment", to: "reviews#comment", as: :review_comment

  resources :readings do
    resources :reviews, only: ['new','create']
  end

end
