class CreateCuestionarios < ActiveRecord::Migration[5.2]
  def change
    create_table :cuestionarios do |t|
      t.string :nombre_cues
      t.integer :eda_a
      t.integer :eda_t
      t.integer :eda_r
      t.integer :eda_p
      t.timestamps
    end
  end
end
