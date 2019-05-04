Rails.application.routes.draw do

  get 'characters/update_characters', as: 'update_characters'
  get 'comics/best_sellers', as: 'best_sellers'

  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions",
                      omniauth_callbacks: "callbacks" }
  root 'home#index'
  resources :comics
  resources :artists
  resources :reviews

  post 'user_comics/add_comic_to_user/:comic_id', to:'user_comics#add_comic_to_user', as:'add_comic_to_user'

  resources :comics do
    resources :reviews
  end

  resources :users do
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
