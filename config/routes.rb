Rails.application.routes.draw do
  resources :repairs, only: [:show, :create]
  resources :work_orders, only: [] do
    member do
      get :available_appointments
    end
  end
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
