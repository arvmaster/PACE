class Cuestionario < ApplicationRecord
  belongs_to :user
  has_many :pregunta_cuestionarios
  accepts_nested_attributes_for :pregunta_cuestionarios

  #permite crear una copia 'EXCEPTO' del id y su tiempo de creacion, lo cual al hacer .save
  # lo cual es perfecto para clonar objetos
  amoeba do
    enable
    include_association :pregunta_cuestionarios
    prepend :nombre_cues => "Cuestionario "
  end

end
