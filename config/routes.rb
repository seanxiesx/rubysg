Rubysg::Application.routes.draw do
  root "home#index"
  resources :events
end
