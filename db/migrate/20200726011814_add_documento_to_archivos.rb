class AddDocumentoToArchivos < ActiveRecord::Migration[5.2]
  def change
    #tener carrierwave en archivos
    add_column :archivos, :documento, :string
  end
end
