class CreateEventos < ActiveRecord::Migration[5.2]
  def change
    create_table :eventos do |t|
      t.string :nombre_ev
      t.date  :fecha_ev
      t.string :link_ev
      t.string :descripcion
      t.timestamps
    end
  end
end
