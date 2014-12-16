Colchonet::Application.routes.draw do
  LOCALES = /en|pt\-BR/

  scope "(:locale)", :locales => LOCALES do
    resources :rooms
    resources :users

    resources :user_confirmation, :only => [:show]
  end

  get '/:locale' => 'home#index', locale: LOCALES
  root "home#index"
end