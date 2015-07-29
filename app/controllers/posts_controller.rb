class PostsController < ApplicationController
  def new
  	@categories = Category.all.collect { |category| [category.name,category.id] } 
  end

  def create
  	if(params[:is_activity])
  	  @post = Activity.new(post_params)
  	else
  	  @post = Post.new(post_params)
  	end
    @post.save!
    redirect_to @post
  end
  
  def show
    @post = Post.find(params[:id])
    @latest_posts = Post.last(10)
  end
  
  def index
    @posts = Post.all
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
