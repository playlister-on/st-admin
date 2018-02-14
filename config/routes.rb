Rails.application.routes.draw do
  namespace :portal do
    resources :configs do
      member do
        post :load_users
      end
      resources :users do
        collection do
          post :push
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
