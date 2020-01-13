Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tasks#index'

  resources :users do
    collection do
      get 'logout'
    end
  end

  resources :tasks do
    patch :change_status
    patch :change_completed
    collection do
      get 'todays_task'
      get 'tomorrows_task'
      get 'all_task'
      get 'complete_task'
    end
  end
end
