Rails.application.routes.draw do
  root to: 'tweets#home'
  resources :tweets do
      collection do
          post :confirm
      end
  end
end
