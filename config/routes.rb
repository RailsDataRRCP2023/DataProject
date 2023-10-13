Rails.application.routes.draw do
  root "home#index"

  resources :aiml_salaries
  resources :global_electricity_statistics
  resources :world_bank_countries
  resources :countries_names

  get 'about', to: 'about#index'

end
