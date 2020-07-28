class Archivo < ApplicationRecord
    mount_uploader :documento, DocumentoUploader

    belongs_to :user

    validates :documento, presence: true
end
