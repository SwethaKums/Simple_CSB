class Teacher < ApplicationRecord

    has_secure_password
	has_and_belongs_to_many :students
	has_many :book_edits
	has_many :books ,:through =>:book_edits

    scope :ascending ,lambda { order("id ASC") }


    validates :first_name ,:presence=>true
    validates :last_name, :presence=>true
    validates :email_id ,	:presence=>true,
                             :length=>{:maximum=>100},
                             :format=> /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i ,
                             :confirmation=>true

end
