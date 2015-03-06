# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  answer      :text             not null
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class AnswerChoice < ActiveRecord::Base
  validates :answer, presence: true

  has_many(
  :responses,
  foreign_key: :answer_choice_id,
  primary_key: :id,
  class_name: :Response
  )

  belongs_to(
  :question,
  foreign_key: :question_id,
  primary_key: :id,
  class_name: :Question
  )
end
