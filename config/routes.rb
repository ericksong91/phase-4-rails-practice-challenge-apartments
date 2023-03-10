Rails.application.routes.draw do
  resources :apartments, only: [:index, :show, :update, :create, :destroy]
  resources :leases, only: [:create, :destroy]
  resources :tenants, only: [:index, :show, :update, :create, :destroy]
end
