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
end
