class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :company_id
      t.string :last_name
      t.string :first_name
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
