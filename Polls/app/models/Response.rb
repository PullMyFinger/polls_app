class Response < ActiveRecord::Base
  #validate :respondent_has_not_already_answered_question
  #validate :respondent_is_not_author

  belongs_to(
  :user,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: :User
  )

  belongs_to(
  :answer_choice,
  foreign_key: :answer_choice_id,
  primary_key: :id,
  class_name: :AnswerChoice
  )

  has_one(
  :question,
  through: :answer_choice,
  source: :question
  )

  def sibling_responses
    if self.id.nil?
      question.responses
    else
      question.responses.where('responses.id != ?', self.id)
    end
  end

  def respondent_has_not_already_answered_question
    if sibling_responses.where('responses.user_id != ?', self.user_id).exists?
      errors[:base] << "User already answered question"
    end
  end

  def respondent_is_not_author
    if question.poll.user.id == self.user_id
      errors[:base] << "Stop cheating you fuck!!"
    end
  end
end
