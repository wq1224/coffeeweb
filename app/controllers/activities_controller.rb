class ActivitiesController < ApplicationController
  def list
    @activities = Activity.where(status: 1).order(id: :desc)
    @categories = Category.all
    @latest_posts = Post.where(status: 1).order(id: :desc).limit(10)
  end
end
