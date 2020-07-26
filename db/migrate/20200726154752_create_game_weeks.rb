class CreateGameWeeks < ActiveRecord::Migration[6.0]
  def change
    create_table :game_weeks do |t|
      t.references :season, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
