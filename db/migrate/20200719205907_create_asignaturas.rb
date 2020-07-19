class CreateAsignaturas < ActiveRecord::Migration[5.2]
  def change
    create_table :asignaturas do |t|
      t.string :nombrearchivo
      t.boolean :estado
      t.references :asignatura
      t.timestamps
    end
  end
end
