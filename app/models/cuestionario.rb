class Cuestionario < ApplicationRecord
  belongs_to :user
  has_many :pregunta_cuestionarios
end
