class AddStatus < ActiveRecord::Migration
  def change
  	add_column :friendships, :status, :string, :default => false
  end
end
