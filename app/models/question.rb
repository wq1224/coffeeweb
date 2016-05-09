class Question < ActiveRecord::Base
	belongs_to :group
	belongs_to :parent, :class_name => 'Question'
	#has_many :sub_questions, :class_name => 'Question', :foreign_key => 'parent_id'
end
