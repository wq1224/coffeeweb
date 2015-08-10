class Admin::MembersController < Admin::AdminController

  def new
    @statuses = [["禁止",:user_status_banned],["正常",:user_status_registered]]
  end
  
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to admin_member_path(@member), notice: '创建成功' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @member = Member.find(params[:id])
    @statuses = [["禁止",:user_status_banned],["正常",:user_status_registered]]
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_member_url(@member)
    else
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
    binding.pry
    @member.destroy
    respond_to do |format|
      format.html { redirect_to admin_members_url, notice: '用户已成功删除' }
      format.json { head :no_content }
    end
  end
   
  private
    def member_params
      params.require(:member).permit(:username,:password,:email,:phone,:status,:type)
    end
end
