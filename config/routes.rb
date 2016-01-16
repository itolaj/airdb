Rails.application.routes.draw do

  #this allowes the director to create users
  #please uncoment #, :skip => [:registrations] after you have made your first sign up so you can be able to create users from the table
  devise_for :users, :skip => [:registrations]
  devise_scope :user do
  get "signup",   :to => "users#new"
  get "signin",   :to => "devise/sessions#new"
  get "signout",  :to => "devise/sessions#destroy"
  get "cancel_user_registration", :to => "devise/registrations#cancel"
  post "user_registration",       :to => "users#create"
  get "new_user_registration",    :to => "users#new"
  get "edit_user_registration",   :to => "users#edit"
  end

  resources :users do
    get "delete"
  end
  resources :purchases do
    get "delete"
  end
  resources :appointments do
    get "delete"
  end
  resources :appointments do
    resources :comments
  end
  resources :customers do
    get "delete"
  end
  resources :products do
    get "delete"
  end

  root :to => 'airdb#home'

  get 'update' => "customer#update", :as => "update"
  get '/weeklyAppointments', to: 'appointments#weeklyAppointments'
  get '/dailyAppointments', to: 'appointments#dailyAppointments'
  get '/allAppointments', to: 'appointments#allAppointments'
  get '/finishedAppointments', to: 'appointments#finishedAppointments'
  get '/pendingAppointments', to: 'appointments#pendingAppointments'
  get '/reminders', to: 'purchases#reminders'

end
