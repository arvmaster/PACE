class Informe < ApplicationRecord
  belongs_to :user
  has_many :pregunta_informes
  accepts_nested_attributes_for :pregunta_informes

  amoeba do
    enable
    include_association :pregunta_informes
  end
end
