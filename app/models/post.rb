class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :creator, :class_name => 'Member', :foreign_key => 'creator_id'
end
