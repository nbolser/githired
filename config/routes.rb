Rails.application.routes.draw do
  resources :searches, only: [:index, :create]
end
