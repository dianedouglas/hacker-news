Rails.application.routes.draw do
  root to: 'links#index'

  resources :links do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  match('/links/:id/upvote', {:via => [:patch, :put], :to => 'upvotes#update'})

end
