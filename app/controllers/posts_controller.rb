class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.new(post_params)
    binding.pry
    @post.save
    redirect_to @post
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all
  end
   
  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
