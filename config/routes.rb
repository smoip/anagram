Rails.application.routes.draw do
  root "games#index"

  resources :words, only: [] do
    collection do
      get :fetch_new
    end
  end
end
