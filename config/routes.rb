Rails.application.routes.draw do
  root "home#index"

  resources :aiml_salaries
  resources :global_electricity_statistics
  
  # Custom collection route for WorldBankCountries
  resources :world_bank_countries, only: [] do
    collection do
      get :top_gdp
    end
  end

  resources :world_bank_countries do
    member do
      get :top_salaries
    end
  end  

  resources :world_bank_countries do
    collection do
      get :top_electricity
    end
  end  

  resources :world_bank_countries
  resources :countries_names
  
  get 'about', to: 'about#index'
end
