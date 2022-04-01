class Estudio < ApplicationRecord
  has_many :users
  belongs_to :recinto, optional: true
  validates :name, uniqueness: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Estudio.create! row.to_hash
    end
  end
end
