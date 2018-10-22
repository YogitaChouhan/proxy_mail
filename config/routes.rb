Rails.application.routes.draw do

  # get 'welcome/index'

  resources :welcome

  root to: 'schedules#new'
  match '/handle_inbound' => 'schedules#handle_inbound', via: [:get, :post]
  resources :schedules
  patch '/schedules/:id', to: 'schedules#update'

  devise_for :users, :controllers => {
    :confirmations => "confirmations",
    :registrations => "users/registrations",
    :sessions => "users/sessions"
  }
end
