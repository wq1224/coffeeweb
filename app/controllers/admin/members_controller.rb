class Admin::MembersController < Admin::AdminController
  def new
    @statuses = get_statuses
    @types = get_types
  end
  
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { 
          flash[:success] = '创建成功' 
          redirect_to admin_member_path(@member)
        }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { 
          flash.now[:error] = '创建失败'
          render :new
        }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @member = Member.find(params[:id])
    @statuses = get_statuses
    @types = get_types
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:success] = '更新成功'
      redirect_to admin_member_url(@member)
    else
      flash.now[:error] = '更新失败'
      render 'edit'
    end
  end
  
  def show
    @member = Member.find(params[:id])
  end
  
  def index
    @members = Member.all
  end
  
  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { 
        flash[:success] = "用户已成功删除"
        redirect_to admin_members_url
      }
      format.json { head :no_content }
    end
  end
   
  private
    def member_params
      params.require(:member).permit(:username,:password,:email,:phone,:status,:type)
    end
    
    def get_statuses
      [["禁止",:user_status_banned],["正常",:user_status_registered]]
    end
    
    def get_types
      [["管理员",:Admin],["普通用户",:Normal],["超级管理员",:SuperAdmin]]
    end
end
