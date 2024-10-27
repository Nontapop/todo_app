Rails.application.routes.draw do
  resources :tasks, only: [:index, :create, :update, :destroy] do
    member do
      patch :complete
    end
  end

  root "tasks#index"
end
