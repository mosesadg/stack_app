require 'rails_helper'

describe 'navigate' do
 describe 'index' do
 	it 'can be reached succesffully' do
 		visit questions_path
 		expect(page.status_code).to eq(200)
 	end

 	it 'has a title of Questions' do
 		visit questions_path
 		expect(page).to have_content(/Questions/)
 	end
 end

 describe 'creation' do
 	before do
 		user = User.create(email:"test@test.com", password:"password123", password_confirmation:"password123", first_name: "Jon", last_name:"Doe")
		login_as(user)
		visit new_question_path
 	end

 	it 'has a new form that can be reached' do
 		expect(page.status_code).to eq(200)
 	end

 	it 'can be created fron new form page' do
    fill_in 'question[date]', with: Date.today
    fill_in 'question[text]', with: "Something"
    click_on "Save"
    expect(page).to have_content("Something")
 	end

 	it 'will have a user associated with it' do
 		fill_in 'question[date]', with: Date.today
  	fill_in 'question[text]', with: "User Association"
  	click_on "Save"

  	expect(User.last.questions.last.text).to eq("User Association")
  end
 end
end