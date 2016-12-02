Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/merchants/find_all' => 'merchant_search#index', as: "merchants/find_all"
      get '/merchants/find' => 'merchant_search#show', as: "merchants/find"
      get '/merchants/random' => 'merchant_random#show', as: "merchants/random"
      get '/merchants/most_items' => 'merchants_items#show', as: "merchants/most_items"
      get '/merchants/revenue' => 'merchants_revenues#index', as: "merchants/revenue"
      get '/merchants/most_revenue' => 'merchants_most_revenues#index', as: "merchants/most_revenue"

      get '/customers/find_all' => 'customer_search#index', as: "customers/find_all"
      get '/customers/find' => 'customer_search#show', as: "customers/find"
      get '/customers/random' => 'customer_random#show', as: "customers/random"

      get '/invoices/find_all' => 'invoice_search#index', as: "invoices/find_all"
      get '/invoices/find' => 'invoice_search#show', as: "invoices/find"
      get '/invoices/random' => 'invoice_random#show', as: "invoices/random"

      get '/transactions/find_all' => 'transaction_search#index', as: "transactions/find_all"
      get '/transactions/find' => 'transaction_search#show', as: "transactions/find"
      get '/transactions/random' => 'transaction_random#show', as: "transactions/random"

      get '/items/find_all' => 'item_search#index', as: "items/find_all"
      get '/items/find' => 'item_search#show', as: "items/find"
      get '/items/random' => 'item_random#show', as: "items/random"
      get '/items/most_items' => 'items_most_items#show', as: "items/most_items"
      get '/items/most_revenue' => 'items_most_revenues#show', as: "items/most_revenue"

      get '/invoice_items/find_all' => 'invoice_item_search#index', as: "invoice_items/find_all"
      get '/invoice_items/find' => 'invoice_item_search#show', as: "invoice_items/find"
      get '/invoice_items/random' => 'invoice_item_random#show', as: "invoice_items/random"

      resources :merchants, only: [:index, :show] do
        scope module: "merchants" do
          resources :items, only: [:index]
          resources :invoices, only: [:index]
          get '/favorite_customer' => 'favorite_customers#index', as: "favorite_customer"
          get '/revenue' => 'revenues#index', as: "revenue"
          get '/customers_with_pending_invoices' => 'pending_invoices#index', as: "customers_with_pending_invoices"
        end
      end

      resources :customers, only: [:index, :show] do
        scope module: "customers" do
          resources :invoices, only: [:index]
          resources :transactions, only: [:index]
          get '/favorite_merchant' => 'favorite_merchants#index', as: "favorite_merchant"
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
          get '/best_day' => 'best_day#index', as: "best_day"
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
