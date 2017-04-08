Rails.application.routes.draw do
  resources :todos do
    resources :items
  end
end
