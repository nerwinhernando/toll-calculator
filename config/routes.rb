Rails.application.routes.draw do
  root 'calculator#index'
  resources :calculations, only: [:create]
  get "up" => "rails/health#show", as: :rails_health_check
end
