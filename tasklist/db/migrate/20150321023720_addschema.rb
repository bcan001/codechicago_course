class Addschema < ActiveRecord::Migration
  def change
  	create_table "tasks", force: true do |t|
	    t.datetime "created_at",  null: false
	    t.datetime "updated_at",  null: false
	    t.string   "description", null: false
	    t.datetime "deadline"
	  end
  end
end
