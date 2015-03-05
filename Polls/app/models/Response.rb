class Response < ActiveRecord::Base
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

    def self.sibling_responses
      question.responses
    end
end
