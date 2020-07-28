class Recinto < ApplicationRecord
  has_many :estudios
  has_many :users
end
