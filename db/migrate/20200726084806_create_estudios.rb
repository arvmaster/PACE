class CreateEstudios < ActiveRecord::Migration[5.2]
  def change
    create_table :estudios do |t|
      t.string :nombre_estudio
      t.string :codigo
      t.boolean :estado
      t.timestamps
    end
  end
end
