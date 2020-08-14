class Evento < ApplicationRecord
  has_many :user_eventos
  has_many :users, through: :user_eventos
end
