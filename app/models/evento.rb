class Evento < ApplicationRecord
  has_many :user_eventos
  has_many :users, through: :user_eventos
  validates :nombre_ev, presence: true
  validates :fecha_ev, presence: true
  validates :descripcion, presence: true
end
