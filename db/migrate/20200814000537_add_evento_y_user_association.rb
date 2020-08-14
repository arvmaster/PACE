class AddEventoYUserAssociation < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :user_eventos, :users, column: :user_id, primary_key: :id
    add_foreign_key :user_eventos, :eventos, column: :evento_id, primary_key: :id
  end
end
