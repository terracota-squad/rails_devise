Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    passwords: 'admins/passwords'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root 'pages#home'
  get 'pages/profile', to: 'pages#users', as: 'pages_profile'
  get 'pages/users', to: redirect('/pages/profile')
  post 'pages/ban/:id', to: 'pages#ban_user', as: 'pages_ban_user'
  post 'pages/unban/:id', to: 'pages#unban_user', as: 'pages_unban_user'
  get 'admin/dashboard', to: 'pages#admin', as: 'admin_dashboard'
  get 'pages/admin', to: redirect('/admin/dashboard')
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

