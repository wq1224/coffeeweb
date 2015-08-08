class Admin::MembersController < Admin::AdminController

  def new
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
   
  private
    def member_params
      params.require(:member).permit(:username,:password,:email,:phone,:status,:type)
    end
end
