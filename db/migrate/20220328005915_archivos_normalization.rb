class ArchivosNormalization < ActiveRecord::Migration[7.0]
  def change
    change_column :archivos, :nombre_archivo,:name
    change_column :archivos, :asignatura, :subject
    change_column :archivos, :topico, :topic
  end
end
