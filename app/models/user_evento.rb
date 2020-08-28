class UserEvento < ApplicationRecord
  belongs_to :user
  belongs_to :evento
  #valida que haya solo un user con este evento
  validates_uniqueness_of :user_id, scope: :evento_id, :message => "Ya participas en este Evento"
  validates :user_id, presence: true
  validates :evento_id, presence: true
end
