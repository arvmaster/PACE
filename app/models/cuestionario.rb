class Cuestionario < ApplicationRecord
  belongs_to :user
  has_many :pregunta_cuestionarios
  accepts_nested_attributes_for :pregunta_cuestionarios
end
