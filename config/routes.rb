Rails.application.routes.draw do
  get 'twitter/index'

  root 'twitter#index'
end
