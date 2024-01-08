Rails.application.routes.draw do

  localized do
    get '/', to: 'pages#index', as: 'root'

    resources :images
    resources :texts
    resources :products
    resources :board_members, only: [:edit, :update, :new, :create, :destroy]
    resources :document_group_categories, only: [:show, :new, :edit, :update, :create, :destroy]
    resources :document_groups, only: [:show, :new, :edit, :create, :update, :destroy]
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

    get '/document_group_categories/:id/new_document_group' => 'document_groups#new', as: 'new_document_group_for_category'
    get '/document_groups/:id/new_document' => 'documents#new', as: 'new_document_for_group'

    get '/dokumentit', to: 'document_groups#index', as: 'dokumentit'

    get '/dokumentit/:name', to: 'document_groups#show', as: 'document_group_page'

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
    get '/komero' => 'pages#komero', id: 'komero'
    get '/sahkopostilistat' => 'pages#sahkopostilistat', id: 'sahkopostilistat'
    get '/kerhot' => 'pages#kerhot', id: 'kerhot'
    get '/klusteri' => 'pages#klusteri', id: 'klusteri'
    get '/fuksiopas' => 'pages#fuksiopas', id: 'fuksiopas'
    get '/tuutorit' => 'pages#tuutorit', id: 'tuutorit'
    get '/sanasto' => 'pages#sanasto', id: 'sanasto'
    get '/kurssikuvauksia' => 'pages#kurssikuvauksia', id: 'kurssikuvauksia'
    get '/tenttiarkisto' => 'pages#tenttiarkisto', id: 'tenttiarkisto'
    get '/virkailijaksi' => 'pages#virkailijaksi', id: 'virkailijaksi'
    get '/yhteystiedot' => 'pages#yhteystiedot', id: 'yhteystiedot'
    get '/lomakkeet' => 'pages#lomakkeet', id: 'lomakkeet'
    get '/historia' => 'pages#historia', id: 'historia'
    get '/tiedotuskanavat' => 'pages#tiedotuskanavat', id: 'tiedotuskanavat'
    get '/turvallinen_tila' => 'pages#turvallinen_tila', id: 'turvallinen_tila'
    get '/tilat' => 'pages#tilat', id: 'tilat'
    get '/tuotteet' => 'pages#tuotteet', id: 'tuotteet'
    get '/yleiset_tapahtumat' => 'pages#yleiset_tapahtumat', id: 'yleiset_tapahtumat'
    get '/juhlat' => 'pages#juhlat', id: 'juhlat'
    get '/kulttuuri' => 'pages#kulttuuri', id: 'kulttuuri'
    get '/liikunta' => 'pages#liikunta', id: 'liikunta'
    get '/pelailu' => 'pages#pelailu', id: 'pelailu'
    get '/tutkinto' => 'pages#tutkinto', id: 'tutkinto'
    get '/tukea_opiskeluun' => 'pages#tukea_opiskeluun', id: 'tukea_opiskeluun'
    get '/helpot_nopat' => 'pages#helpot_nopat', id: 'helpot_nopat'
    get '/edunvalvonta' => 'pages#edunvalvonta', id: 'edunvalvonta'
    get '/tervehdys' => 'pages#tervehdys', id: 'tervehdys'
    get '/yhteistyo' => 'pages#yhteistyo', id: 'yhteistyo'
    get '/hinnasto' => 'pages#hinnasto', id: 'hinnasto'
    get '/tyhja_joukko' => 'pages#tyhja_joukko', id: 'tyhja_joukko'
    get '/julkaisut' => 'pages#julkaisut', id: 'julkaisut'
    get '/toimitus' => 'pages#toimitus', id: 'toimitus'

    # old title pages
    # get '/jarjesto' => 'pages#jarjesto', id: 'jarjesto'
    # get '/toiminta' => 'pages#toiminta', id: 'toiminta'
    # get '/fuksille' => 'pages#fuksille', id: 'fuksille'
    # get '/yrityksille' => 'pages#yrityksille', id: 'yrityksille'

    get '/virat' => 'positions#index'

    get '/events/ical/events' => 'events#ical', as: 'ical'
    get '/events/ical/signup_starts' => 'events#ical_signup_starts', as: 'ical_signup_starts'

    get '/english' => redirect("/en")
    get "en/*path" => redirect("/en")
    get "*path" => redirect("/")
  end
end