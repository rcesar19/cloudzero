Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#index'
  get 'pages/index.html', to: 'pages#index'
  get '/azure', to: 'pages#pagina_azure', as: 'azure'
  get '/aws', to: 'pages#pagina_aws', as: 'aws'
  get '/gcp', to: 'pages#pagina_gcp', as: 'gcp'
  get 'azuretipo1/tipo1', to: 'pages#azuretipo1', as: 'azuretipo1'
  get 'azuretipo2/tipo2', to: 'pages#azuretipo2', as: 'azuretipo2'
  get 'azuretipo3/tipo3', to: 'pages#azuretipo3', as: 'azuretipo3'

  get 'awstipo1/tipo1', to: 'pages#awstipo1', as: 'awstipo1'
  get 'awstipo2/tipo2', to: 'pages#awstipo2', as: 'awstipo2'
  get 'awstipo3/tipo3', to: 'pages#awstipo3', as: 'awstipo3'

  get 'gcptipo1/tipo1', to: 'pages#gcptipo1', as: 'gcptipo1'
  get 'gcptipo2/tipo2', to: 'pages#gcptipo2', as: 'gcptipo2'
  get 'gcptipo3/tipo3', to: 'pages#gcptipo3', as: 'gcptipo3'

  post '/execute_terraform_aws_instance1', to: 'pages#execute_terraform_aws_instance1'
  post '/execute_terraform_azure_instance1', to: 'pages#execute_terraform_azure_instance1'

  get 'terraform_output', to: 'pages#_terraform_output', as: '_terraform_output'
  get 'awssuccess', to: 'pages#awssuccess'
  get 'azuresuccess', to: 'pages#azuresuccess'
end
