Rails.application.routes.draw do

  resources :attendance_records
  resources :schools
  
  # resources :attendance_records do
  #   collection do
  #     get 'roll_call'
  #   end
  # end

  get '/roll_call', to: 'attendance_records#roll_call'

  root 'attendance_records#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'


  resources :students
  #patch '/students', to: 'attendance_records#update'
  #post '/students', to: 'attendance_records#create'
  
  resources :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
