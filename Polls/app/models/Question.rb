# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  poll_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :body, presence: true

  belongs_to(
  :poll,
  foreign_key: :poll_id,
  primary_key: :id,
  class_name: :Poll
  )

  has_many(
  :answer_choices,
  foreign_key: :question_id,
  primary_key: :id,
  class_name: :AnswerChoice
  )

  has_many(
  :responses,
  through: :answer_choices,
  source: :responses
  )

  def results
    answers = AnswerChoice
      .select('answer_choices.answer, COUNT(responses.id) AS david_rules')
      .joins('LEFT OUTER JOIN responses ON responses.answer_choice_id = answer_choices.id')
      .joins('LEFT OUTER JOIN questions ON questions.id = answer_choices.question_id')
      .where('questions.id' => self.id)
      .group('answer_choices.id')

    results_hash = {}
    answers.each do |answer|
      results_hash[answer.answer] = answer.david_rules
    end

    results_hash
  end
end
