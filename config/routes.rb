Rails.application.routes.draw do
    namespace :api do
        namespace :v1 do
            post '/login', :to => 'sessions#create'
            post '/signup', :to => 'users#create'
        end
    end
end
