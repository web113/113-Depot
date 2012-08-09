class Category < ActiveRecord::Base
	has_many :subcategories, :dependent => :destroy
end
