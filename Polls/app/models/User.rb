# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :user_name, presence: true

  has_many(
  :responses,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: :Response
  )

  has_many(
  :polls,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: :Poll
  )

  def completed_polls
    Poll.find_by_sql(["
    SELECT
      polls.id, COUNT(questions.id) AS counted
    FROM
      polls
    JOIN
      questions ON questions.poll_id = polls.id
    GROUP BY
      polls.id
    HAVING

    COUNT(questions.id) =
      (SELECT
        COUNT(responses.*)
      FROM
        responses
      LEFT OUTER JOIN
        answer_choices ON responses.answer_choice_id = answer_choices.id
      JOIN
        questions ON questions.id = answer_choices.question_id
      WHERE
        responses.user_id = ? )", self.id])
  end
end
