class CreateTeachers < ActiveRecord::Migration[6.1]
  def up
    create_table :teachers do |t|
      t.string "first_name" ,:limit=>40
      t.string "last_name", :limit=>20
      t.string "email_id", :default=>"", :null=> false
      t.string "password", :limit=>20
      t.timestamps
    end
  end
  def down
    drop_table :teachers
  end
end
