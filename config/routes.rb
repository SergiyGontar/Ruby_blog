Rails.application.routes.draw do
  root "posts#index", as: "home"

# For getting about.html.erb use "pages" controller with "About" method
  get 'about' => 'pages#about', as:"about"

#resources Should chek all steps of "posts" controller
  resources :posts do 
    resources :comments
    # will check all comments links inside post link
  end

end
