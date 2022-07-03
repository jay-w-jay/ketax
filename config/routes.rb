Rails.application.routes.draw do
  resources :calculations
  get 'welcome/index'
  root 'calculations#new'
end
