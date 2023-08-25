class CreateStudents < ActiveRecord::Migration[6.1]
  def up
    create_table :students do |t|
      t.integer "college_id"
      t.string "student_name" ,:limit=>50
      t.string "student_address" , :limit=>100
      t.string "permalink"
      t.timestamps
    end
    add_index("students","college_id")
    add_index("students","permalink")
  end

    def down
      drop_table :students
    end

  
end
