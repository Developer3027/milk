class BlogPostsController < ApplicationController
  before_action :authenticate_user_and_admin, except: %i[index show]
  before_action :set_blog_post, only: %i[show edit update destroy]
  before_action :set_categories

  def index
    @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published.sorted
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.user = current_user
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to blogs_path
  end

  private

  def authenticate_user_and_admin
    redirect_to root_path, alert: 'Not authorized' unless user_signed_in? || admin_signed_in?
  end

  def blog_post_params
    params.require(:blog_post).permit(:cover_image, :title, :content, :published_at, :category_id)
  end

  def set_blog_post
    @blog_post = user_signed_in? || current_admin? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to blogs_path
  end

  def set_categories
    @categories = Category.all.order(:name)
  end
end
