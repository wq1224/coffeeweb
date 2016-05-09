class UsersController < ApplicationController
  respond_to :json
  def apply
    @groups = Group.all
    @questions = Hash.new
    @groups.each do |group|
      @questions.store(group.id, Question.where(:group => group.id))
    end
  end


   
  private
    def post_params
      params.require(:post).permit(:title, :content,:image,:image_cache, :category_id)
    end
end
