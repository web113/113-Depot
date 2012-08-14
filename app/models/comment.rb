class Comment < ActiveRecord::Base
	belongs_to :product
	belongs_to :user

	validates :title, :context, :presence => true

	SCORE_TYPES = [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
end
