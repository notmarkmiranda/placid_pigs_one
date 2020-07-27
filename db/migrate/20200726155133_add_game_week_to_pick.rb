class AddGameWeekToPick < ActiveRecord::Migration[6.0]
  def change
    add_reference :picks, :game_week, null: false, foreign_key: true
  end
end
