class Recinto < ApplicationRecord
  has_many :estudios
  has_many :users

  validates :name, uniqueness: true
end
