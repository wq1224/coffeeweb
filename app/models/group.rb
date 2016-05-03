class Group < ActiveRecord::Base
	has_many :users, :through => :user_join_groups
	has_many :questions
end
