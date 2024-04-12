class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find(params[:id])

    # send back to blog root if no article found
    rescue ActiveRecord::RecordNotFound
      redirect_to blog_posts_path
  end
end
