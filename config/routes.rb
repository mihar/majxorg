V8::Application.routes.draw do
  resources :locations

  resources :tweets

  resources :tracks

  resources :posts

  resources :bookmarks

  resources :photos

  match '/location' => "pages#location"
  root :to => "pages#index"
end
