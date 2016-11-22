class RemoveColumns < ActiveRecord::Migration
  def change
      remove_column :usermeetups, :user_id, :integer
  end
end
