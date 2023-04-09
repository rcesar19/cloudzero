Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#index'
  get 'pages/index.html', to: 'pages#index'
  get '/azure', to: 'pages#pagina_azure', as: 'azure'
  get '/aws', to: 'pages#pagina_aws', as: 'aws'
  get '/gcp', to: 'pages#pagina_gcp', as: 'gcp'
end
