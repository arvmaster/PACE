class AddFirstForeignKeys < ActiveRecord::Migration[5.2]
  def change
    #llaves de user : one-to-many,
    add_column :archivos, :user_id, :integer
    add_foreign_key :archivos, :users, column: :user_id, primary_key: :id
    add_column :datos_carreras, :user_id, :integer
    add_foreign_key :datos_carreras, :users, column: :user_id, primary_key: :id
  end
end
