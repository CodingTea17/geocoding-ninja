Rails.application.routes.draw do
  get 'user/show'

  root to: "landing#index"
  devise_for :users

  resources :users do
    resources :jobs
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # EX.
  # resources :products do
  #   resources :reviews, :except => [:show, :index, :destroy, :edit, :update]
  # end
end
