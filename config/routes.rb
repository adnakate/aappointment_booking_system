Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :coaches, only: [:index] do
        get :available_slots, on: :collection
      end
      resources :appointments, only: [:create]
    end
  end
end
