class CreatePreguntaCuestionarios < ActiveRecord::Migration[5.2]
  def change
    create_table :pregunta_cuestionarios do |t|
      t.text :pregunta_cues
      t.boolean :casilla
      t.text :respuesta
      t.timestamps
    end
  end
end
