Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  get "up" => "rails/health#show", as: :rails_health_check

  resources :presentations do
    resources :evaluations
  end

  
  resources :presentations do
    member do
      patch :update_grade
    end
  end


  # Defines the root path route ("/")
  root "presentations#index"

  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
end
