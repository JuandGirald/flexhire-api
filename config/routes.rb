Rails.application.routes.draw do
  mount ActionCable.server => "/cable"

  post "/graphql", to: "graphql#execute"
  post '/webhook', to: 'webhook#webhook'
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  if Rails.env.development?
  #  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql"
  end
end
