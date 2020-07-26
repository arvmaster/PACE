class CreateArchivos < ActiveRecord::Migration[5.2]
  def change
    create_table :archivos do |t|
      t.string :nombre_archivo
      t.string :topico
      t.string :asignatura
      t.timestamps
    end
  end
end
