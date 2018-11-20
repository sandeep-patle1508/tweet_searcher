Rails.application.routes.draw do
  get 'twitter/index'

  post 'twitter/search'

  root 'twitter#index'
end
