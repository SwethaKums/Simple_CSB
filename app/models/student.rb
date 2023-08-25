class Student < ApplicationRecord
	belongs_to :college
	has_many :books
	has_and_belongs_to_many :teachers
    scope :ascending ,lambda { order("id ASC") }

    validates :student_name ,:presence =>true,
                              :length=>{:maximum=>50}
    validates :student_address ,:presence =>true,
                              :length=>{:maximum=>100}
                                                        
    validates :permalink ,:presence=>true,
                          :length=>{:within=>1..255},
                          :uniqueness=>true

end


		