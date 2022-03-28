class Archivo < ApplicationRecord
    #uploader de carrierwave, pero solo es sencillo subir elementos
    #mount_uploader :documento, DocumentoUploader
    has_one_attached :file
    belongs_to :user
    validates :asignatura, presence: true
    validates :topico, presence: true
    validates :name, presence: true
    validates :file, presence: true, blob: { size_range: 1..4.megabytes }
end
