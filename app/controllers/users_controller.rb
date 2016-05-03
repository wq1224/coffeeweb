class UsersController < ApplicationController
  respond_to :json
  def apply
  	@questions = Question.all
    @groups = Group.all
  end


   
  private
    def post_params
      params.require(:post).permit(:title, :content,:image,:image_cache, :category_id)
    end
end
