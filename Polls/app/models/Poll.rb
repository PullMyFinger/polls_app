class Poll < ActiveRecord::Base
  validates :title, presence: true
  
  has_many(
  :questions,
  foreign_key: :poll_id,
  primary_key: :id,
  class_name: :Question
  )

  belongs_to(
  :user,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: :User
  )

end
