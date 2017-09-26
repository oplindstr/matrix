Rails.application.routes.draw do

  resources :board_members, only: [:index, :new, :create, :destroy]
  resources :document_group_categories
  resources :document_groups
  resources :documents, only: [:index, :new, :create, :destroy]
  resources :event_parameter_choices
  resources :event_parameter_types
  resources :event_parameter_values
  resources :event_parameters
  resources :events
  resources :memberships
  resources :news
  resources :position_members
  resources :positions
  resources :post_comments
  resources :post_tags
  resources :posts
  resources :settings
  resources :signup_parameters
  resources :signups
  resources :users

  resource :session, only: [:new, :create, :delete]

  get '/blogi', to: 'posts#index'
  get '/blogi/:tag(.:format)', to: 'posts#tag_specific'

  get '/board_members_and_positions', to: 'board_members#board_members_and_positions'

  get '/document_group_categories/:id/new_document_group' => 'document_groups#new'
  get '/document_groups/:id/new_document' => 'documents#new'

  get '/dokumentit', to: 'document_groups#index'

  get '/dokumentit/:name', to: 'document_groups#show'

  get '/events/:id/new_parameter' => 'event_parameters#new'

  get '/hallitus', to: 'board_members#index'
  get '/hallitus/:vuosi', to: 'board_members#index'

  get '/kalenteri' => 'events#index'

  get '/kalenteri/:id/ilmoittautumiset(.:format)' => 'signups#show', as: 'event_signups'

  get '/kalenteri/vuosi/:year' => 'events#events_by_year'
 
  get '/users/:id/new_password' => 'users#new_password', as: 'new_password'
  get '/salasanan_palautus' => 'users#password_recovery', as: 'password_recovery'
  get '/kayttajatunnuksen_palautus' => 'users#username_recovery', as: 'username_recovery'
  post '/users/recover_username' => 'users#recover_username', as: 'recover_username'
  post '/users/recover_password' => 'users#recover_password', as: 'recover_password'
  patch '/users/:id/update_password' => 'users#update_password', as: 'update_password'
  patch '/users/:id/add_picture' => 'users#add_picture', as: 'add_picture'
  
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  # pages
  get '/admin' => 'pages#admin_tools', id: 'admin'
  get '/english' => 'high_voltage/pages#show', id: 'english'
  get '/jarjesto' => 'high_voltage/pages#show', id: 'jarjesto'
  get '/komero' => 'high_voltage/pages#show', id: 'komero'
  get '/sahkopostilistat' => 'high_voltage/pages#show', id: 'sahkopostilistat'
  get '/yrityksille' => 'high_voltage/pages#show', id: 'yrityksille'
  get '/kerhot' => 'high_voltage/pages#show', id: 'kerhot'
  get '/klusteri' => 'high_voltage/pages#show', id: 'klusteri'
  get '/fuksille' => 'high_voltage/pages#show', id: 'fuksille'
  get '/fuksiopas' => 'pages#fuksiopas', id: 'fuksiopas'
  get '/tuutorit' => 'pages#tuutorit', id: 'tuutorit'
  get '/sanasto' => 'high_voltage/pages#show', id: 'sanasto'
  get '/kurssikuvauksia' => 'high_voltage/pages#show', id: 'kurssikuvauksia'
  get '/rekisteriseloste' => 'high_voltage/pages#show', id: 'rekisteriseloste'
  get '/toiminta' => 'pages#toiminta', id: 'toiminta'
  get '/virkailijaksi' => 'high_voltage/pages#show', id: 'virkailijaksi'
  get '/virat' => 'positions#index'
  get '/yhteystiedot' => 'positions#contact_info'



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
