Rails.application.routes.draw do
  root 'page#index'
  
  resources :expenses do
    member do
      post 'approve'
      post 'deny'
      get 'user_name'
    end
  end
  
  devise_for :employees, path: 'employees'
  devise_for :managers, path: 'managers'
  
end
