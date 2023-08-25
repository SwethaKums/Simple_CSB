class CreateBooks < ActiveRecord::Migration[6.1]
  def up
    create_table :books do |t|
      t.integer "student_id"
      t.string "book_name"
      t.string "author_name"
      t.decimal "price"
      t.boolean "sold" ,:default=>false
      t.timestamps
    end

    add_index("books","student_id")
  end
    def drop
      drop_table :books
    end
  
end
