class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    @latest_posts = Post.last(10)
  end
end
