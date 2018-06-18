Rails.application.routes.draw do
  scope '/hackneyrepairs/v1' do
    resources :repairs, only: [:show, :create]
    resources :work_orders, only: [] do
      member do
        get :available_appointments
        get :appointments, action: :show_appointment
        post :appointments, action: :create_appointment
      end
    end
    get '/properties/:id', to: 'properties#show'
    get '/properties', to: 'properties#find'
    get '/properties/:id/estate', to: 'properties#estate'
    get '/properties/:id/block', to: 'properties#block'
    get '/properties/:id/residents', to: 'properties#residents'
  end
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'admin#index'
end
