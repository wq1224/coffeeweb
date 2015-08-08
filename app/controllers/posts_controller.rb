class PostsController < ApplicationController
  
  def list
    @posts = Post.all
    @latest_posts = Post.last(10)
    @categories = Category.all
  end

  def show
    @post = Post.find(params[:id])
    @latest_posts = Post.last(10)
    @categories = Category.all
  end

  def show_by_categories
    @category = Category.find(params[:id])
    @posts = Post.where(category:params[:id])
    @latest_posts = Post.last(10)
    @categories = Category.all
  end
   
  private
    def post_params
      params.require(:post).permit(:title, :content,:image,:image_cache, :category_id)
    end
end
