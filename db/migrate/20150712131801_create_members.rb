class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :phone
      t.string :type

      t.timestamps null: false
    end
  end
end
