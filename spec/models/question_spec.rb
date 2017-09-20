require 'rails_helper'

RSpec.describe Question, type: :model do
 describe "Creation" do

 	before do 
		@question = Question.create(date: Date.today, text: "Something")
 	end

 	it 'can be created' do
 		expect(@question).to be_valid
 	end

 	it 'cannot be created without a date and rationale' do
 		@question.date = nil
 		@question.text = nil
 		expect(@question).to_not be_valid
 	end
 end
end
