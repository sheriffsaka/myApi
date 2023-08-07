Rails.application.routes.draw do
  resources :animals
  mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # namespace 'api' do
  #   namespace 'V1' do
  #     resources :animals
  #   end
  # end
end
