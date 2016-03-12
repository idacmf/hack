Rails.application.routes.draw do
  devise_for :models
  devise_for :users, controllers: {
      sessions: "users/sessions"
  }

  root 'home#index'

  resources :activity
  get '/activity_types' => 'activity#types'
  get '/travelling_companions' => 'activity#travelling_companions'
  get '/users/my_acc' => 'users#edit_account'
  get '/activity_result' => 'activity#index'
  get '/summary'        =>  'activity#summary'

end