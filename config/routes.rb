Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :local_admin do
    resources :users
  end

  mount Admin::Engine, at: "/admin", as: "admin"
end
