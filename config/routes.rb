Rails.application.routes.draw do
  scope '/hackneyrepairs/v1' do
    resources :repairs, only: [:show, :create]
    resources :work_orders, only: [] do
      member do
        get :available_appointments
        get :appointments, action: :show_appointment
        post :appointments, action: :create_appointment
      end
      resources :notes, only: [:index, :create]
    end
    resources :properties, only: [:index, :show] do
      member do
        get :estate
        get :block
        get :residents
        get :repairs
      end
      resources :notes, only: [:index, :create]
    end
  end
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'admin#index'
end
