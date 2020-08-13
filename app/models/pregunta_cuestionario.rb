class PreguntaCuestionario < ApplicationRecord
  belongs_to :cuestionario
  validates :pregunta_cues ,presence:true
end
