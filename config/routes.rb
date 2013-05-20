Curiouscoders::Application.routes.draw do
  
  get "contact/index"
  match "contact" => "contact#index"

  devise_for :users
  resources :users 
  resources :tutorials

  resources :messages do
    get :autocomplete_user_name, :on => :collection
    member do
      post :remove_recipient
      post :remove_sender
    end
  end

  resources :posts
  resources :conversations

  resources :teams do
  	member do
  		post :join
  		post :leave
  	end
  end
  
  #Mail paths
  match '/inbox' => 'messages#index'
  match '/sent' => 'messages#sent'
  match '/trash' => 'messages#trash'

  match 'tagged' => 'tutorials#tagged', :as => 'tagged'



  authenticated :user do
	  root :to => 'home#index'
  end

  authenticated :admin do
    get "admin/index", :id => "admin"
    match "admin" => "admin#index"
  end

  root :to => "home#index"
  
end