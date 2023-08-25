class AddPasswordDigestToTeachers < ActiveRecord::Migration[6.1]
  def up
    remove_column "teachers","password"
    add_column "teachers", "password_digest", :string
  end

   def down
    remove_column "teachers","password_digest"
    add_column "teachers", "password", :string,:limit=>20
  end
end
