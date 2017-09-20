class Question < ApplicationRecord
	belongs_to :user
	validates_presence_of :date, :text
end
