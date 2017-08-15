Rails.application.routes.draw do

  # точка вхлда
  root to: 'stored_files#index'

  # статическая страница /about
  get '/about' => 'static_pages#about'

  get 'stored_files/index'

end
