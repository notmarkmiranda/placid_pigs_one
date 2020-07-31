class CreateWinners < ActiveRecord::Migration[6.0]
  def change
    create_table :winners do |t|
      t.references :team, null: false, foreign_key: true
      t.date :date

      t.timestamps null: false
    end
  end
end
