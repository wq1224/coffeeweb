class ActivitiesController < ApplicationController
  def list
    @activities = Activity.all
    @categories = Category.all
    @latest_posts = Post.last(10)
  end
end
