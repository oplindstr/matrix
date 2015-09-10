Rails.application.routes.draw do
  resources :stringresources

  resources :signups

  resources :hands

  resources :matches

  resources :players

  resources :events

  get '/events/:id/signups(.:format)' => 'signups#show', as: 'event_signups'

  resources :users

  get 'jatkantappajat' => 'players#index'

  get 'ongoingmatches' => 'matches#ongoing'

  patch 'hands_update' => 'matches#hands_update'

  resource :session, only: [:new, :create, :delete]

  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'



  # pages
  get '/jarjesto' => 'high_voltage/pages#show', id: 'jarjesto'
  get '/toiminta' => 'high_voltage/pages#show', id: 'toiminta'
  get '/komero' => 'high_voltage/pages#show', id: 'komero'
  get '/hallitus' => 'high_voltage/pages#show', id: 'hallitus'
  get '/yhteystiedot' => 'high_voltage/pages#show', id: 'yhteystiedot'
  get '/sahkopostilistat' => 'high_voltage/pages#show', id: 'sahkopostilistat'
  get '/yrityksille' => 'high_voltage/pages#show', id: 'yrityksille'
  get '/kerhot' => 'high_voltage/pages#show', id: 'kerhot'
  get '/klusteri' => 'high_voltage/pages#show', id: 'klusteri'
  get '/fuksille' => 'high_voltage/pages#show', id: 'fuksille'
  get '/fuksiopas' => 'high_voltage/pages#show', id: 'fuksiopas'
  get '/tuutorit' => 'high_voltage/pages#show', id: 'tuutorit'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
