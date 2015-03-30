Colchonet::Application.routes.draw do
  scope "(:locale)", locale: /en|pt/ do
    resources :rooms
    resources :users

    resource :confirmation, :only => [:show]
    resource :user_sessions, :only => [:create, :new, :destroy]
  end

  get '/:locale' => 'home#index', locale: /en|pt/
  root 'home#index'
end

=begin
Colchonet::Application.routes.draw do
  resources :rooms
  resources :users

  resource :confirmation, :only => [:show]
  
  root :to => "home#index"
end
=end



