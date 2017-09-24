Rails.application.routes.draw do

  # точка входа
  root to: 'stored_files#index'

  # статическая страница /about
  get '/about' => 'static_pages#about'

  # общий ресурс с файлами stored_files
  resources :stored_files do
  	collection do
  	  get 'select_images'
  	end
  end
      

end
