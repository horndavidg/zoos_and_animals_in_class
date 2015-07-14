Rails.application.routes.draw do
  
  root "zoos#index"

  resources :zoos do
    resources :animals, shallow: true
  end

end
