Rails.application.routes.draw do

  root 'posts#index'

  get 'about' => 'pages#about'
  resources :posts do
    resources :marks
  end

end
