class RecintoNormalization < ActiveRecord::Migration[7.0]
  def change
    rename_column :recintos, :nombre_recinto, :name
  end
end
