Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#new"
  resources :articles
  resources :image_galleries do
    member do
      delete 'delete_image/:image_id', to: 'image_galleries#delete_image', as: 'delete_image'
    end
  end
end
