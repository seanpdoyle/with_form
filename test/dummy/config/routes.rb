Rails.application.routes.draw do
  resources :widget_records, only: [:new, :create, :edit, :update]
  resources :widgets, only: [:new, :create]
end
