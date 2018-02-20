Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'wellcome#index'

  namespace :authentication do
    resource :session, only: %i[new destroy]
  end

  get 'auth/:provider/callback' => 'authentication/sessions#create'
end
