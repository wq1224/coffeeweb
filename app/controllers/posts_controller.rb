class PostsController < ApplicationController
  
  def list
    @posts = Post.where(status: 1).order(id: :desc)
    @latest_posts = Post.where(status: 1).order(id: :desc).limit(10)
    @categories = Category.all
  end

  def show
    @post = Post.find(params[:id])
    @latest_posts = Post.where(status: 1).order(id: :desc).limit(10)
    @categories = Category.all
  end

  def show_by_categories
    @category = Category.find(params[:id])
    @posts = Post.where(category:params[:id],status:1).order(id: :desc)
    @latest_posts = Post.where(status: 1).order(id: :desc).limit(10)
    @categories = Category.all
  end
   
  private
    def post_params
      params.require(:post).permit(:title, :content,:image,:image_cache, :category_id)
    end
end
