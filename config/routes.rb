Rails.application.routes.draw do



  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }

  root to: 'home#index'

  resources :users do
    resources :products
  end

  resources :products do
    resources :comments
  end

end
