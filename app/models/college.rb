class College < ApplicationRecord
    has_many :students	
    

	scope :ascending ,lambda { order("id ASC") }
	scope :search, lambda {|query| where(["college_name like ?","%#{query}%"])}

    
     validates :college_name ,:presence=>true,
                               :length=>{:maximum=>100}
     validates :college_code, :presence=>true
     validates :college_address ,:presence=>true,
                                :length=>{:maximum=>100}

     validate :location_restriction

     private

    def location_restriction
   restricted_districts = ["kanyakumari", "Theni", "coimbatore", "thirupur"]

  restricted_district = restricted_districts.find { |district| college_address&.downcase&.include?(district.downcase) }

  if restricted_district
    errors.add(:college_address, " is in a restricted district (#{restricted_district}).")
  end
end
 
end
		