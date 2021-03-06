Rails.application.routes.draw do
    namespace :api do
        namespace :v1 do
            resources :contacts, :only => [:index, :show, :create, :update, :destroy]
            resources :jobs, :only => [:index, :show, :create, :update, :destroy]

            post '/login', :to => 'sessions#create'
            post '/signup', :to => 'users#create'
        end
    end
end
