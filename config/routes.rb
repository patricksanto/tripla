Rails.application.routes.draw do
  get 'activities/new'
  get 'activities/create'
  devise_for :users

  root to: "pages#home"

  resources :trips do
    resources :trip_days, only: [:show] do
      resources :activities, only: [:new, :create, :show, :destroy]
    end
  end
end
