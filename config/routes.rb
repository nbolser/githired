Rails.application.routes.draw do
  root 'searches#index'
  resources :searches, only: %i[index create]
end
