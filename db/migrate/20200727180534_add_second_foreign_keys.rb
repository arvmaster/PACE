class AddSecondForeignKeys < ActiveRecord::Migration[5.2]
  def change
    #many-to-many :through
    add_column :informes, :user_id, :integer
    add_column :informes, :pregunta_informe_id, :integer
    add_foreign_key :informes, :users, column: :user_id, primary_key: :id
    add_foreign_key :informes, :pregunta_informes, column: :pregunta_informe_id, primary_key: :id

    add_column :cuestionarios, :user_id, :integer
    add_column :cuestionarios, :pregunta_cuestionario_id, :integer
    add_foreign_key :cuestionarios, :users, column: :user_id, primary_key: :id
    add_foreign_key :cuestionarios, :pregunta_cuestionarios, column: :pregunta_cuestionario_id, primary_key: :id

  end
end
