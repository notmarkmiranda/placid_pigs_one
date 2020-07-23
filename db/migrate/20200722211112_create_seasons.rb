class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.string :name
      t.references :league, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
