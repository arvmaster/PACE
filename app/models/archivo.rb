class Archivo < ApplicationRecord
    #uploader de carrierwave, pero solo es sencillo subir elementos
    #mount_uploader :documento, DocumentoUploader
    has_one_attached :file
    belongs_to :user

end
