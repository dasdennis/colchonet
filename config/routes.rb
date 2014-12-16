Colchonet::Application.routes.draw do
  LOCALES = /en|pt\-BR/

  scope ":locale", :LOCALES => LOCALES do
    resources :rooms
    resources :users

    resources :user_confirmation, :only => [:show]
  end

  match '/:locale' => 'home#index', :locale => LOCALES
  root 'home#index'
end