class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :kind
      t.integer :parent_id
      t.integer :group_id,             null: false
      t.string :question,              null: false
      t.string :default_value

      t.timestamps null: false
    end
  end
end
