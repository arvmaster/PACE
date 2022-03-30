class UserNormalization < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :rut, :dni
    rename_column :users, :nombre_user, :name
    rename_column :users, :apellido_pa, :first_last_name
    rename_column :users, :apellido_ma, :second_last_name
    rename_column :users, :nacionalidad, :nationality
    rename_column :users, :fecha_nacimiento, :born_date
    rename_column :users, :nivel_estudio, :academic_level
    rename_column :users, :fecha_ingreso, :registration_date
    rename_column :users, :especialidad, :specialization_branch
    rename_column :users, :estado, :active
    rename_column :users, :comuna, :commune
    rename_column :users, :direccion, :address
    rename_column :users, :telefono, :phone
    rename_column :users, :rol, :role
    rename_column :users, :supervisar, :superviser
  end
end
