class Archivo < ApplicationRecord
    mount_uploader :documento, DocumentoUploader
    validates :documento, presence: true
end
