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
  post 'books/:id/like', to: 'books#update_like', as: :book_update_like, defaults: {format: :json}
  post 'books/searchAuthor', to: 'searchs#searchAuthor', as: :author_search, defaults: {format: :json}

  get 'books/:id/notations', to: "notations#index", as: :notations
  get 'books/:id/reviews/new', to: "reviews#new", as: :new_review
  post 'books/:id/reviews/new', to: "reviews#create"
  delete 'books/:id/reviews/:id', to: "reviews#destroy"
  get 'books/:id/reviews', to: "reviews#index", as: :reviews
  get 'books/:id/consultReviews', to: "reviews#consult", as: :review_consult
  get 'books/:id/consultNotations', to: "notations#consult", as: :notation_consult
  get 'books/:id/viewnote', to: "notations#view", as: :view_note
  get 'books/:id/viewcomment', to: "reviews#view", as: :view_comment
  get 'books/:user/profil', to: "profils#show", as: :profil_show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'books/:user/followers', to: "followers#create", as: :add_follower
  get 'books/followers', to: "followers#index", as: :view_followers
  delete 'books/:user/followers', to: "followers#destroy", as: :destroy_follower

  post "books/:id/comment", to: "reviews#comment", as: :review_comment



  get "books/historique", to: "historiques#index", as: :historique
  get "books/admin", to: "admins#index", as: :admin


  resources :readings do
    resources :reviews, only: ['new','create']
  end

  namespace :user do
    root :to => "books#index"
  end



end
