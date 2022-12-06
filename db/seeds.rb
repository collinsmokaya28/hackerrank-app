# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Answer.destroy_all
Question.destroy_all

puts "Seeding................................"

user1 = User.create(username: "Hacker", email: "hacker@gmail.com", password: "hacker123")

answer1 = Answer.create(correct_answer: "A call to super invokes the parent method with the same arguments that were passed to the child method. An error will therefore occur if the arguments passed to the child method do not match what the parent is expecting.

A call to super() invokes the parent method without any arguments, as presumably expected. As always, being explicit in your code is a good thing.")

question1 = Question.create(question: "What is the difference between calling super and calling super()?", user_id: user1.id, answer_id: answer1.id)

puts "Done seeding!!!"