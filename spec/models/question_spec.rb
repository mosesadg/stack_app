require 'rails_helper'

RSpec.describe Question, type: :model do
 describe "Creation" do

 	before do 
		@question = Question.create(date: Date.today, text: "Something")
		@user = User.create(email: "test@test.com", password: "password123", password_confirmation: "password123", first_name: "Jon", last_name: "Doe")
 		@question = Question.create(date: Date.today, text: "Anything", user_id: @user.id )
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
