class CreatePreguntaInformes < ActiveRecord::Migration[5.2]
  def change
    create_table :pregunta_informes do |t|
      t.text :pregunta_inf
      t.text :respuesta
      t.timestamps
    end
  end
end
