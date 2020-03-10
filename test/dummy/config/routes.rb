Rails.application.routes.draw do
  resources :widgets, only: [:new]
end
