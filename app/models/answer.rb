class Answer < ApplicationRecord
  belongs_to :question

  def self.search(search)
  	where("body LIKE ?", "%#{search}%")
	end
end
