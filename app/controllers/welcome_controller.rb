class WelcomeController < ApplicationController
  def index
  	@activities = Activity.where(status: 1).where("posts.image IS NOT NULL").order(id: :desc).limit(4)
  	@posts = Post.where(status: 1).where("posts.image IS NOT NULL").order(id: :desc).limit(6)
  end
end
