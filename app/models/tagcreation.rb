class Tagcreation < ApplicationRecord
	 validates :producttag, presence: true
	 validates :producttag, uniqueness: { scope: [:producttitle, :productoption, :productvalue, :productoption1, :productvalue1, :productoption2, :productvalue2], message: "The Tag already exist" }

def self.search_by(search_term)
	where("LOWER(producttitle) like :search_term", search_term: "%#{search_term.downcase}")
end
end
