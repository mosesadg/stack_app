@user= User.create(email:"test@test.com", password:"password123", password_confirmation:"password123", first_name: "Jon", last_name:"Doe")

puts "1 User created"

10.times do |question|
	Question.create(date: Date.today, text:"#{question} sample question", user_id: @user.id)
end

puts "10 questions have been created"