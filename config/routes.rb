Rails.application.routes.draw do
  resources :questions do
  	resources :answers
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static#homepage'
  get 'tags/:tag', to: 'questions#index', as: :tag
end
