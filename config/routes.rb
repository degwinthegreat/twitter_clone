Rails.application.routes.draw do
  resources :contacts
  resources :favorites, only:[:create, :destroy]
  resources :sessions, only:[:new, :create, :destroy]
  resources :users, only:[:new, :create, :show]
  root to: 'tweets#home'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  resources :tweets do
      collection do
          post :confirm
      end
  end
end
