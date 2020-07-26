class CreateCuestionarios < ActiveRecord::Migration[5.2]
  def change
    create_table :cuestionarios do |t|
      t.string :nombre_cues
      t.timestamps
    end
  end
end
