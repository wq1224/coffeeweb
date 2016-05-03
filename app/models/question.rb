class Question < ActiveRecord::Base
	belongs_to :main_question, :class_name => 'Question'
	has_many :sub_questions, :class_name => 'Question', :foreign_key => 'parent_id'
end
