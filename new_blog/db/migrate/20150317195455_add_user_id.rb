class AddUserId < ActiveRecord::Migration
  def change
  	add_column :posts, :user_id, :string
  	add_column :comments, :user_id, :string

  end
end
