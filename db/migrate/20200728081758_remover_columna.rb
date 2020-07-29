class RemoverColumna < ActiveRecord::Migration[5.2]
  #eliminar migracion si se quiere usar Carrierwave para almacenar archivos
  #descomentar en modelo archivo mount tambien
  def change
    remove_column :archivos, :documento
  end
end
