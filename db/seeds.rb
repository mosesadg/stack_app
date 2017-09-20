10.times do |question|
	Question.create(date: Date.today, text:"#{question} sample question")
end

puts "10 questions have been created"