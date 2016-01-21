# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times{ User.create!(user_name: Faker::Internet.user_name) }

20.times{ Poll.create!(author_id: User.all[rand(0...20)].id, title: Faker::Lorem.sentence(3)) }

Poll.all.each do |poll|
  Question.create!(poll_id: poll.id, text: Faker::Lorem.sentence(7))
end

100.times{ Question.create!(poll_id: Poll.all[rand(0...20)].id, text: Faker::Lorem.sentence(7)) }

Question.all.each do |question|
  rand(2..10).times{ AnswerChoice.create!(question_id: question.id, text: Faker::Lorem.sentence(5)) }
end

30.times do
  user_id = rand(1..20)
  Poll.all[rand(0...20)].questions.each do |question|
    answer_id = question.answers.take.id
    Response.create(user_id: user_id, answer_id: answer_id)
  end
end
