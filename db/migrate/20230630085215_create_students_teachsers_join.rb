class CreateStudentsTeachsersJoin < ActiveRecord::Migration[6.1]
  def up
    create_table :students_teachers  ,:id=>false do |t|
      t.integer "teacher_id"
      t.integer "student_id"
    end
    add_index("students_teachers",["teacher_id","student_id"])
end
    def down
      drop_table :students_teachers
  end
end
