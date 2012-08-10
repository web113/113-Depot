class Comment < ActiveRecord::Base
	belongs_to :product
	belongs_to :user

	validates :title, :context, :presence => true
end
