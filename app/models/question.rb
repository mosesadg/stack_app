class Question < ApplicationRecord
	validates_presence_of :date, :text
end
