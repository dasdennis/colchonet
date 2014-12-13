Rails.application.routes.draw do
  scope ":locale" do
    resources :rooms
    resources :users

    resources :user_confirmation, :only => [:show]
  end

  root 'home#index'
end