Rails.application.routes.draw do
  devise_for :companies
  get '/vacancies/all' => 'vacancies#all'
  authenticated :company do
    root to: 'vacancies#index', as: :company_root
  end
  unauthenticated :company do
    root to: 'vacancies#all', as: 'unauthenticated_root'
  end

  resources :applicants, only: :create
  resources :vacancies do
    resources :applicants, only: %i[index]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
