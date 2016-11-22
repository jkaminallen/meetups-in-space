class AddColumns < ActiveRecord::Migration
  def change
    add_column :usermeetups, :user_id, :integer
    add_column :usermeetups, :meetup_id, :integer
  end
end
