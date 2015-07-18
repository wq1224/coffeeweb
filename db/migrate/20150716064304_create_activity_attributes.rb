class CreateActivityAttributes < ActiveRecord::Migration
  def change
    create_table :activity_attributes do |t|
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps null: false
    end
  end
end
