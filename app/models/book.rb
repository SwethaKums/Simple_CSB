class Book < ApplicationRecord
	belongs_to :student
	has_many :book_edits
	has_many :teachers ,:through =>:book_edits
	 scope :ascending ,lambda { order("id ASC") }

	 AUTHOR_TYPE=["ForeignAuthor","LocalAuthor"]

validates :book_name ,:presence=>true,
                       :length=>{:maximum=>50}
validates :author_name, :presence=>true,
                        :length=>{:maximum=>25}
validates_inclusion_of :author_type, :in => AUTHOR_TYPE,
    :message => "must be one of: #{AUTHOR_TYPE.join(', ')}"
    validates :price, numericality: { greater_than_or_equal_to: 0 }



end
