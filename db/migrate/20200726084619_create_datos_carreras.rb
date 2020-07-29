class CreateDatosCarreras < ActiveRecord::Migration[5.2]
  def change
    create_table :datos_carreras do |t|
      t.string  :nombre_carrera
      t.string  :area
      t.string  :institucion
      t.float   :ret_1a
      t.integer :pun_last_ma
      t.float   :duracion_for
      t.float   :duracion_real
      t.float   :emp_1a
      t.float   :emp_2a
      t.integer :mat_h
      t.integer :mat_m
      t.integer :tit_h
      t.integer :tit_m
      t.integer :ing_1a
      t.integer :ing_5a
      t.integer :ing_10a

      t.timestamps
    end
  end
end
