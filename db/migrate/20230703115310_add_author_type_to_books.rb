class AddAuthorTypeToBooks < ActiveRecord::Migration[6.1]
  def up
    add_column :books, :author_type, :string
  end
end
