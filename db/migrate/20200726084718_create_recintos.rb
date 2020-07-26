class CreateRecintos < ActiveRecord::Migration[5.2]
  def change
    create_table :recintos do |t|
      t.string :nombre_recinto
      t.timestamps
    end
  end
end
