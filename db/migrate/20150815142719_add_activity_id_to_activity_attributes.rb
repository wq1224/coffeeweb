class AddActivityIdToActivityAttributes < ActiveRecord::Migration
  def change
    add_column :activity_attributes, :activity_id, :integer
  end
end
