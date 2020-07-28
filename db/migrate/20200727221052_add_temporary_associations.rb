class AddTemporaryAssociations < ActiveRecord::Migration[5.2]
  def change
    add_column :estudios, :recinto_id, :integer
    add_foreign_key :estudios, :recintos, column: :recinto_id, primary_key: :id

    add_column :users, :recinto_id, :integer
    add_column :users, :estudio_id, :integer
    add_foreign_key :users, :recintos, column: :recinto_id, primary_key: :id
    add_foreign_key :users, :estudios, column: :estudio_id, primary_key: :id
  end
end
