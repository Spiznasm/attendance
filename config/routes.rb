Rails.application.routes.draw do
  resources :attendance_records
  resources :students

  #get 'roll_call', to: 'students#roll_call'
  post 'roll_call', to: 'students#roll_call'
  post 'roll_call_update', to: 'students#roll_call_update'
  

  get '/rollcall', to: 'attendance_rosters#roll_call'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
