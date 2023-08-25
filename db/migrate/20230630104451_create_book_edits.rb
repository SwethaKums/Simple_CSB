class CreateBookEdits < ActiveRecord::Migration[6.1]
 def up
    create_table :book_edits do |t|
      t.integer "teacher_id"
      t.integer "book_id"
      t.date "due_date"
      t.timestamps
    end
    add_index("book_edits",["teacher_id","book_id"])
end
    def down
      down_table :book_edits
    end
  
end
