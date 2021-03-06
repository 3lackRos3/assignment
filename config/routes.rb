Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tasks#index'
  resources :tasks do
    collection do
      get :completed
      get :pending
      get 'priority/:priority' => :priority
    end
  end
end
