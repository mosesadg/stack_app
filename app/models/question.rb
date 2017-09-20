class Question < ApplicationRecord
	belongs_to :user
	has_many :answers
	validates_presence_of :date, :text
	acts_as_taggable 

	def self.search(search)
  	where("text LIKE ?", "%#{search}%")
	end
end
