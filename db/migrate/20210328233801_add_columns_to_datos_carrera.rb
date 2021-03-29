class AddColumnsToDatosCarrera < ActiveRecord::Migration[5.2]
  def change
    add_column :datos_carreras, :cod_institucion, :integer
    add_column :datos_carreras, :cod_uniq_carrera, :string
    add_column :datos_carreras, :titulo, :string
    add_column :datos_carreras, :tipo_institucion, :string
  end
end
