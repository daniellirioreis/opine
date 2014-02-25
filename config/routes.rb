Opine::Application.routes.draw do

  devise_for :users

  resources :users

  resources :proposals

  resources :polls

  resources :polls do
    get :like, on: :member
    get :unlike, on: :member
    get :autocomplete_proposal, on: :collection
  end


  root :to => redirect('/users/sign_in')

  get '/home', :to => 'home#index', :as => :home
  get "home/index"

end
