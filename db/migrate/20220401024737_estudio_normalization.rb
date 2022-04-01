class EstudioNormalization < ActiveRecord::Migration[7.0]
  def change
    rename_column :estudios, :nombre_estudio, :name
    rename_column :estudios, :estado, :active
    rename_column :estudios, :codigo, :code
  end
end
