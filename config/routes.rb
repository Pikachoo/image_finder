Rails.application.routes.draw do
  devise_for :users

  mount SecurityImage::API => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :images
  resources :tags do
    resources :images, only: [:index]
  end

end
