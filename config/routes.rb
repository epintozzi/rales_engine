Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        scope module: "merchants" do
          resources :items, only: [:index]
          resources :invoices, only: [:index]
          get '/favorite_customer' => 'favorite_customers#index', as: "favorite_customer"
          get '/revenue' => 'revenues#index', as: "revenue"
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
          get '/merchant' => 'merchants#index',   as: "merchant"
        end
      end

      resources :invoice_items, only: [:index, :show] do
        scope module: "invoice_items" do
          get '/invoice' => 'invoices#index',   as: "invoice"
          get '/item' => 'items#index',   as: "item"
        end
      end

      resources :transactions, only: [:index, :show] do
        scope module: "transactions" do
          get '/invoice' => 'invoices#index',   as: "invoice"
        end
      end
    end
  end
end
