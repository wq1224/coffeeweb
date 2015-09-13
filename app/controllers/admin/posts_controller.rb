class Admin::PostsController < Admin::AdminController
  def new
  	@categories = Category.all.collect { |category| [category.name,category.id] }
  	@statuses = get_statuses
  end

  def edit
    @categories = Category.all.collect { |category| [category.name,category.id] }
    @statuses = get_statuses  
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = '更新成功'
      redirect_to admin_post_url(@post)
    else
      flash.now[:error] = '更新失败'
      @categories = Category.all.collect { |category| [category.name,category.id] }
      @statuses = get_statuses
      render 'edit'
    end
  end

  def create
  # 	if(params[:is_activity])
  # 	  @post = Activity.new(post_params)
  # 	else
  	  @post = Post.new(post_params)
  # 	end
    respond_to do |format|
      if @post.save
        format.html { 
          flash[:success] = '创建成功' 
          redirect_to admin_post_url(@post)
        }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { 
          flash.now[:error] = '创建失败'
          @categories = Category.all.collect { |category| [category.name,category.id] }
          @statuses = get_statuses
          render :new
        }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { 
        flash[:success] = "删除成功"
        redirect_to admin_posts_url
      }
      format.json { head :no_content }
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all
  end
   
  private
    def post_params
      params.require(:post).permit(:title, :content,:image,:image_cache,:type,:status, :category_id)
    end
    
    def get_statuses
      [["草稿",:post_status_draft],["发布",:post_status_publish]]
    end
end
