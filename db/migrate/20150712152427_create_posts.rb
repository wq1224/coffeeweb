class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :category_id
      t.string :title
      t.text :content
      t.integer :creator_id
      t.string :status
      t.string :type

      t.timestamps null: false
    end
  end
end
