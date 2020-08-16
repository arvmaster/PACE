class UserEvento < ApplicationRecord
  belongs_to :user
  belongs_to :evento

  validates :user_id, uniqueness: true
end
