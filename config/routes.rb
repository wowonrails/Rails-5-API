Rails.application.routes.draw do

  scope format: true, constraints: { format: 'json' } do
    post   "/login"   => "sessions#create"
    delete "/logout"  => "sessions#destroy"
  end

  resources :todos do
    resources :items
  end
end
