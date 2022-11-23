Rails.application.routes.draw do

  localized do
    get '/', to: 'pages#index', as: 'root'

    resources :images
    resources :texts
    resources :products
    resources :board_members, only: [:edit, :update, :index, :new, :create, :destroy]
    resources :document_group_categories
    resources :document_groups
    resources :documents, only: [:index, :new, :create, :destroy, :edit, :update]
    resources :event_parameter_choices
    resources :event_parameter_types
    resources :event_parameter_values
    resources :event_parameters
    resources :members, only: [:edit, :update, :index, :new, :create, :destroy]
    resources :news
    resources :events, path: 'kalenteri'
    resources :partners, only: [:edit, :update, :index, :new, :create, :destroy]
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

    get '/board_members_and_positions', to: 'board_members#board_members_and_positions'

    get '/document_group_categories/:id/new_document_group' => 'document_groups#new'
    get '/document_groups/:id/new_document' => 'documents#new'

    get '/dokumentit', to: 'document_groups#index', as: 'dokumentit'

    get '/dokumentit/:name', to: 'document_groups#show'

    post '/events/:id/sign_up', to: 'events#sign_up'
    patch '/events/:id/update_signup', to: 'events#update_signup'

    get '/hallitus', to: 'board_members#index', as: 'hallitus'
    get '/hallitus/:vuosi', to: 'board_members#index'

    get '/kalenteri' => 'events#index', as: 'kalenteri'

    get '/kalenteri/:id/ilmoittautumiset(.:format)' => 'signups#show', as: 'event_signups'

    get '/kalenteri/vuosi/:year' => 'events#events_by_year'

    get '/menneet_tapahtumat' => 'events#past_events', as: 'past_events'

    get '/uusi_salasana' => 'users#new_password', as: 'new_password'
    get '/salasanan_palautus' => 'users#password_recovery', as: 'password_recovery'
    get '/kayttajatunnuksen_palautus' => 'users#username_recovery', as: 'username_recovery'
    post '/users/recover_username' => 'users#recover_username', as: 'recover_username'
    post '/users/recover_password' => 'users#recover_password', as: 'recover_password'
    patch '/update_password' => 'users#update_password', as: 'update_password'
    patch '/users/:id/update_password' => 'users#update_password'
    patch '/users/:id/add_picture' => 'users#add_picture', as: 'add_picture'
    patch '/users/:id/remove_picture' => 'users#remove_picture', as: 'remove_picture'

    patch 'add_picture' => 'users#add_picture'
    patch 'remove_picture' => 'users#remove_picture'

    get '/memberships' => 'users#memberships', as: 'memberships'
    get '/memberships/:vuosi(.:format)' => 'users#memberships'
    post '/update_memberships' => 'users#update_memberships', as: 'update_memberships'
    post '/memberships_by_year' => 'users#memberships_by_year', as: 'memberships_by_year'

    delete '/signups/:id/delete' => 'signups#delete', as: 'delete_signup'
    
    get '/signin', to: 'sessions#new'
    delete '/signout', to: 'sessions#destroy'

    get '/omat_tiedot', to: 'users#self', as: 'self'
    get '/liity', to: 'users#new', as: 'member_sign_up'

    # pages
    get '/admin' => 'pages#admin_tools'
    get '/jarjesto' => 'pages#jarjesto', id: 'jarjesto'
    get '/komero' => 'pages#komero', id: 'komero'
    get '/sahkopostilistat' => 'pages#sahkopostilistat', id: 'sahkopostilistat'
    get '/yrityksille' => 'pages#yrityksille', id: 'yrityksille'
    get '/kerhot' => 'pages#kerhot', id: 'kerhot'
    get '/klusteri' => 'pages#klusteri', id: 'klusteri'
    get '/fuksille' => 'pages#fuksille', id: 'fuksille'
    get '/fuksiopas' => 'pages#fuksiopas', id: 'fuksiopas'
    get '/tuutorit' => 'pages#tuutorit', id: 'tuutorit'
    get '/sanasto' => 'pages#sanasto', id: 'sanasto'
    get '/kurssikuvauksia' => 'pages#kurssikuvauksia', id: 'kurssikuvauksia'
    get '/tenttiarkisto' => 'pages#tenttiarkisto', id: 'tenttiarkisto'
    get '/toiminta' => 'pages#toiminta', id: 'toiminta'
    get '/virkailijaksi' => 'pages#virkailijaksi', id: 'virkailijaksi'
    get '/yhteystiedot' => 'pages#yhteystiedot', id: 'yhteystiedot'

    get '/virat' => 'positions#index'

    get '/events/ical' => 'events#ical', as: 'ical'
  end
end