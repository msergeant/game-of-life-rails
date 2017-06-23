Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/worlds/next', to: 'world_iterations#show', as: 'world_iterations'
end
