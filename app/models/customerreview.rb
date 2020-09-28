class Customerreview < ApplicationRecord
	has_many :Customerreviewtags
	accepts_nested_attributes_for :Customerreviewtags

end
