class CreateUserJoinGroups < ActiveRecord::Migration
  def change
    create_table :user_join_groups do |t|
      t.integer :user_id,              null: false
      t.integer :group_id,          null: false
      t.string :status,             null: false

      t.timestamps null: false
    end
  end
end
