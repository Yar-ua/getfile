Rails.application.routes.draw do

  # точка входа
  root to: 'stored_files#index'

  # статическая страница /about
  get '/about' => 'static_pages#about'

  # общий ресурс с файлами stored_files
  resources :stored_files, only: [:index, :create, :destroy]
  get 'stored_files/:id', action: :download, controller: 'stored_files' 
    

end
