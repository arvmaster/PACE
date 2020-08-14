class CreateUserEventos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_eventos do |t|
      t.integer :user_id
      t.integer :evento_id
      t.boolean :asiste
      t.timestamps
    end
  end
end
