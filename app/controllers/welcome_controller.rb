class WelcomeController < ApplicationController
  def index
  	@activities = Activity.last(4)
  	@posts = Post.last(6)
  end
end
