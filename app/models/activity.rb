class Activity < Post
  has_one :activity_attributes, class_name: ActivityAttribute, dependent: :destroy
end