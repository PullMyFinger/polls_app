User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

# 20.times do |n|
#   User.create!(user_name: "User #{n}")
# end
#
# 5.times do |n|
#   Poll.create!(title: "Poll #{n}", user_id: (n+1))
# end
#
# 30.times do |n|
#   Question.create!(body: "Question #{n}", poll_id: ((n%5) + 1))
# end
#
# 120.times do |n|
#   AnswerChoice.create!(answer: "Answer #{n}", question_id: (n%30) + 1)
# end
#
# 20.times do |n|
#   Response.create!(user_id: (n+1), answer_choice_id: 5)
# end
#
# 6.times do |n|
#   Response.create!(user_id: 5, answer_choice_id: 1 + 24 * n)
# end

User.create!(user_name: "Ned")
User.create!(user_name: "Admin")
Poll.create!(title: "This is the poll", user_id: 2)

Question.create!(body: "What is your answer?", poll_id: 1)
AnswerChoice.create!(answer: "Yes", question_id: 1)

Response.create!(user_id: 1, answer_choice_id: 1)
Response.create!(user_id: 2, answer_choice_id: 1)
