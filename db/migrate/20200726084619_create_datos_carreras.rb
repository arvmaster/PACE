class CreateDatosCarreras < ActiveRecord::Migration[5.2]
  def change
    create_table :datos_carreras do |t|
      t.string  :nombre_carrera
      t.integer :matricula_hombre
      t.integer :matricula_mujer

      t.timestamps
    end
  end
end
