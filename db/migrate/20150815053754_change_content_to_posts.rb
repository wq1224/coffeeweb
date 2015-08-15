class ChangeContentToPosts < ActiveRecord::Migration
  def change
    change_column :posts, :content, :longtext
  end
end
