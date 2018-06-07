Rails.application.routes.draw do
  resources :repairs, only: [:show, :create]
  resources :work_orders, only: [] do
    member do
      get :available_appointments
      get :Appointments, action: :show_appointment
      post :Appointments, action: :create_appointment
    end
  end
  get '/Properties/:id', to: 'properties#show'
  get '/Properties', to: 'properties#find'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
