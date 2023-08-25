class CreateColleges < ActiveRecord::Migration[6.1]
  def up
    create_table :colleges do |t|
      t.string 'college_code', :default=>'',:null=>false
      t.string 'college_name' , :limit=>100
      t.string 'college_address' ,:limit=>100
      t.timestamps
    end
  end

    def down 
      drop_table :colleges
    end
  
end
