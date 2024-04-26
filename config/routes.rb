Rails.application.routes.draw do
  resources :courses
  resources :categories
  devise_for :admins, skip: [:registrations]
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }

  resources :blog_posts do
    resource :cover_image, only: [:destroy], module: :blog_posts
  end

  # resources :eruditions #//? Courses
  # get 'pages/home' #//! remove if not needed
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # get the admin root
  get "admin" => "admin#index"

  # show form for new article
  # get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_post

  # get specific article
  # get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post

  # patch / update a specific article
  # patch "/blog_posts/:id", to: "blog_posts#update"

  # delete / destroy a specific article
  # delete "/blog_posts/:id", to: "blog_posts#destroy"

  # show edit form article
  # get "/blog_posts/:id/edit", to: "blog_posts#edit", as: :edit_blog_post

  # save new article to db
  # post "/blog_posts", to: "blog_posts#create", as: :blog_posts

  # get the blog root
  get "/blog_posts", to: "blog_posts#index", as: :blogs

  # get the feature blog
  get "pages/feature", to: "pages#feature", as: :feature

  # get the erudition landing page
  get "pages/erudition", to: "pages#erudition", as: :erudition

  # Defines the root path route ("/")
  root "pages#home"

end
