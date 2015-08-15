class Admin::CategoriesController <  Admin::AdminController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/categories
  # GET /admin/categories.json
  def index
    @categories = Category.all
  end

  # GET /admin/categories/1
  # GET /admin/categories/1.json
  def show
    @category = Category.find(params[:id])
  end

  # GET /admin/categories/new
  def new
  end

  # GET /admin/categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html {
          flash[:success] = '创建成功'
          redirect_to admin_category_path(@category)
        }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { 
          flash.now[:error] = '创建失败'
          render :new
        }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/categories/1
  # PATCH/PUT /admin/categories/1.json
  def update
    
    respond_to do |format|
      if @category.update(category_params)
        format.html {
          flash[:success] = '更新成功'
          redirect_to admin_category_url(@category)
        }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html {
          flash.now[:error] = '更新失败'
          render :edit
        }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html {
        flash[:success] = "删除成功"
        redirect_to admin_categories_url
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name,:desc)
    end
end
