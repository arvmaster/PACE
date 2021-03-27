class ChangeDefaultValuesCuesAndInform < ActiveRecord::Migration[5.2]
  def change
    change_column_default :cuestionarios, :eda_a, from: nil, to: 0
    change_column_default :cuestionarios, :eda_p, from: nil, to: 0
    change_column_default :cuestionarios, :eda_r, from: nil, to: 0
    change_column_default :cuestionarios, :eda_t, from: nil, to: 0
  end
end
