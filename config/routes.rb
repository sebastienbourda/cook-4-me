Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :meals, except: %i[index show]
  resources :offers do
    patch "/bookings/:id", to: "bookings#accept"
    resources :bookings, except: %i[index new destroy] do
      resources :reviews, only: %i[show create]
    end
  end
  get "/dashboard", to: "pages#dashboard"
  resources :chefs, only: %i[edit update]
end
