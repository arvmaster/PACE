class UserEvento < ApplicationRecord
  belongs_to :user
  belongs_to :evento

  validates :user_id, presence: true
  validates :evento_id, presence: true
end
