Rails.application.routes.draw do
  resources :countries do
    get :shipping_rates, :on => :collection
    get :index, to:  "countries#index"
    get :country_first, on: :collection
    get :show_by_code, on: :collection
  end

  # resources :countries

  # original code: ???
  # resources :countries, :only => [] do
  #   get :shipping_rates, :on => :collection
  #   # get :index, to:  "countries#index"
  # end
end
