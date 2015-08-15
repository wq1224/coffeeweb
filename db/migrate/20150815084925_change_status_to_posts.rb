class ChangeStatusToPosts < ActiveRecord::Migration
  def change
    change_column :posts, :status, :int
  end
end
