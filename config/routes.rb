Rails.application.routes.draw do
  root "users#show"

  devise_for :users, path: 'auth', path_names:
    { sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      confirmation: 'verification',
      unlock: 'unblock',
      registration: 'register',
      sign_up: 'cmon_let_me_in' }

  resources :login, only: [:index]

  resources :users, only: [:show, :edit, :update] do
    resources :profile, only: [:show]
  end

  resources :salons, only: [:new, :create, :show, :edit, :update] do
    resources :services, only: [:new, :create, :show]
    resources :products, only: [:new, :create, :show]
  end
end
