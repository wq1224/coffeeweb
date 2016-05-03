class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :groupname,              null: false
      t.string :description
      t.integer :price

      t.timestamps null: false
    end
  end
end
