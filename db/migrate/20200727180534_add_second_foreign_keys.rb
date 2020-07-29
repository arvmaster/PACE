class AddSecondForeignKeys < ActiveRecord::Migration[5.2]
  def change
    #many-to-many :through
    add_column :informes, :user_id, :integer
    add_column :pregunta_informes, :informe_id, :integer
    add_foreign_key :informes, :users, column: :user_id, primary_key: :id
    add_foreign_key :pregunta_informes, :informes, column: :informe_id, primary_key: :id

    add_column :cuestionarios, :user_id, :integer
    add_column :pregunta_cuestionarios, :cuestionario_id, :integer
    add_foreign_key :cuestionarios, :users, column: :user_id, primary_key: :id
    add_foreign_key :pregunta_cuestionarios, :cuestionarios, column: :cuestionario_id, primary_key: :id

  end
end
