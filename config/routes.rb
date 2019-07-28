Rails.application.routes.draw do
  devise_for :gyms, path: 'gyms', controllers: { registrations: "gyms/registrations", sessions: "gyms/sessions"}
  devise_for :athletes, path: 'athletes', controllers: { registrations: "athletes/registrations", sessions: "athletes/sessions", omniauth_callbacks: "athletes/omniauth_callbacks"}

  resources :gym_reviews
  resources :course_comments
  resources :worksheets

  #courses routes
  resources :courses
  put '/courses/:id/join', to: 'courses#join', as: 'courses_join'
  put '/courses/:id/leave', to: 'courses#leave', as: 'courses_leave'

  #coupons routes
  resources :coupons
  put '/coupons/:id/join', to: 'coupons#join', as: 'coupons_join'
  put '/coupons/:id/leave', to: 'coupons#leave', as: 'coupons_leave'

  #gyms routes
  resources :gyms
  put '/gyms/:id/join', to: 'gyms#join', as: 'gyms_join'
  put '/gyms/:id/leave', to: 'gyms#leave', as: 'gyms_leave'

  #home and guest routes
  root 'home#index'
  get '/guest', to: 'home#guest'
  get '/about', to: 'home#about'
  get '/login', to: 'home#login'

  #athlete routes
  get '/athlete/profile', to: 'athlete#profile'
  get '/athlete/settings', to: 'athlete#settings'
  get '/athlete/my_gyms', to: 'athlete#my_gyms'
  get '/athlete/my_courses', to: 'athlete#my_courses'
  get '/athlete/my_coupons', to: 'athlete#my_coupons'
  get '/athlete/my_worksheets', to: 'athlete#my_worksheets'
  post '/athlete/settings', to: 'athlete#change_settings'

  #gym routes
  get '/gym/profile', to: 'gym#profile'
  get '/gym/address', to: 'gym#address'
  get '/gym/my_courses', to: 'gym#my_courses'
  get '/gym/my_coupons', to: 'gym#my_coupons'
  get '/gym/my_worksheets', to: 'gym#my_worksheets'
  post '/gym/address', to: 'gym#change_address'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
