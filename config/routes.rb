Rails.application.routes.draw do
  # Admin is not registerable
  # Admin created only per console or seed
  devise_for :admins, skip: [:registrations]

  # devise controllers accessible in controllers
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  # authenticate admin home
  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end

  # get the admin root
  get "admin", to: "admin#index", as: :admin

  # admin routes for courses
  namespace :admin do
    resources :courses do
      resources :lessons
    end
    resources :users
  end

  resources :thatches
  resources :categories

  resources :blog_posts do
    resource :cover_image, only: [:destroy], module: :blog_posts
  end

  # lessons resources in courses for users
  resources :courses do
    resources :lessons
  end

  # resources :courses do
  #   resources :course_image, only: [:destroy], module: :courses
  # end

  # resources :eruditions #//? Courses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up", to: "rails/health#show", as: :rails_health_check

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
  get "/blog", to: "blog_posts#index", as: :blogs

  # get the feature blog
  get "feature", to: "pages#feature", as: :feature

  # get the erudition landing page
  get "erudition", to: "pages#erudition", as: :erudition

  # get the hermit landing page
  get "hermit", to: "pages#hermit", as: :hermit

  # get the salt and tar landing page
  get "salt_and_oak", to: "pages#salt_and_oak", as: :salt_and_oak

  # get the thatch landing page
  get "tune", to: "pages#tune", as: :tune

  # Defines the root path route ("/")
  root "pages#home"
end
