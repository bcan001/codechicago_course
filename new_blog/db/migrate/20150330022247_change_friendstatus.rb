class ChangeFriendstatus < ActiveRecord::Migration
  def change
  	change_column :friendships, :status, :boolean, :default => false
  end
end
