Rails.application.routes.draw do
  
  resources :categories
  devise_for :users
  resources :articles do
    resources :comments, only: [:create,:destroy,:update]
  end  
=begin  
    get "/artcles" index
    post "/articles" create
    delete "/articles/:id" destroy
    get "/artcles/:id" show
    get "/artcles/new" new
    get "/artcles/:id/edit" edit
    patch "/artcles/:id" update
    put "/artcles/:id" update
=end
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
