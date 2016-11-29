Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        scope module: "merchants" do
          resources :items, only: [:index]
          resources :invoices, only: [:index]
        end
      end

      resources :customers, only: [:index, :show] do
        scope module: "customers" do
          resources :invoices, only: [:index]
          resources :transactions, only: [:index]
        end
      end

      resources :invoices, only: [:index, :show] do
        scope module: "invoices" do
          resources :transactions, only: [:index]
          resources :invoice_items, only: [:index]
          resources :items, only: [:index]
          get '/customer' => 'customers#index',   as: "customer"
          get '/merchant' => 'merchants#index',   as: "merchant"
        end
      end

      resources :items, only: [:index, :show] do
        scope module: "items" do
          resources :invoice_items, only: [:index]
          resources :merchants, only: [:index]
        end
      end

      resources :invoice_items, only: [:index, :show] do
        scope module: "invoice_items" do
          resources :invoices, only: [:index]
          resources :items, only: [:index]
        end
      end

      resources :transactions, only: [:index, :show] do
        scope module: "transactions" do
          resources :invoices, only: [:index]
        end
      end
    end
  end
end
