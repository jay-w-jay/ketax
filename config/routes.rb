Rails.application.routes.draw do
  resources :calculations
  get 'welcome/index'
  root 'calculations#new'

  # API routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :paye
      get 'calculate_paye', to: 'paye#calculate'
    end
  end
end
