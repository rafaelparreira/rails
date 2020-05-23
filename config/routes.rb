Rails.application.routes.draw do
  root 'page#index'
  #devise_for :employees
  # devise_for :managers
  #root :to => redirect('/expenses')
  resources :expenses do
    member do
      post 'approve'
    end
  end
  
  devise_for :managers,
    path: 'managers',
    path_names: {
      sign_in: 'login',
      sign_out: 'sign_out'
    }

  namespace :api, defaults: { format: :json } do
    namespace :managers do
      devise_scope :managers do
        post 'login', to: 'sessions#create', defaults: { format: :json }
        delete 'sign_out', to: 'sessions#destroy', defaults: { format: :json }
      end
    end
  end 
  
  devise_for :employees, path: 'employees'#, controllers: { sessions: "employees/sessions",registrations: "employees/registrations"}
  #devise_for :managers, path: 'managers'#, controllers: { sessions: 'managers/sessions_controller',registrations: 'managers/registrations',passwords: 'managers/passwords'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
