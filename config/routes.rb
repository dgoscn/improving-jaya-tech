Rails.application.routes.draw do
  resources :events, only: [:create]
  resources :issues, only: [:index, :show] do
    resources :events, only: [:index]
  end
  #resource :github_webhooks, only: :create, defaults: { formats: :json }
end
