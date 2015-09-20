class ChangePasswordToMember < ActiveRecord::Migration
  def change
  	rename_column :members, :password, :password_digest
  end
end
