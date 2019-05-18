Rails.application.routes.draw do
  resources :talks do
  
  collection do
    post :confirm
  end
end
end
