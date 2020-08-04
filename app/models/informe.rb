class Informe < ApplicationRecord
  belongs_to :user
  has_many :pregunta_informes
  accepts_nested_attributes_for :pregunta_informes
end
