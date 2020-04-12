Rails.application.routes.draw do
  resources :widget_records, only: [:new, :create, :edit, :update]
  resources :widgets, only: [:new, :create]

  namespace :scopes do
    resources :rich_widgets, only: [:new]
  end

  namespace :models do
    resources :rich_widgets, only: [:new]
  end
end
