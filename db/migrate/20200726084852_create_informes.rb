class CreateInformes < ActiveRecord::Migration[5.2]
  def change
    create_table :informes do |t|
      t.string :nombre_inf
      t.timestamps
    end
  end
end
