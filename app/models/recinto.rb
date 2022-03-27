class Recinto < ApplicationRecord
  has_many :estudios
  has_many :users

  validates :nombre_recinto, uniqueness: true
end
