class Informe < ApplicationRecord
  belongs_to :user
  has_many :pregunta_informes
end
