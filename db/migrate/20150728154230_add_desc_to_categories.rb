class AddDescToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :desc, :text
  end
end
