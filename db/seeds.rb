# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create!  :email => 'qqq@mail.ru', :password => '123456', :password_confirmation => '123456'

rng = 1..6
rng.each do |n|
  Question.create! :user_id => 1, :head => "question number #{n}" , :body => 'text text text'
end

rng.each do |n|
  rng.each do |z|
    Answer.create! :body => "Answer num #{z}", :question_id => n, :user_id => 1
  end
end

puts 'New user created: ' << user.email
