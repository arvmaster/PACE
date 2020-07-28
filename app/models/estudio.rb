class Estudio < ApplicationRecord
  has_many :users
  belongs_to :recinto
end
