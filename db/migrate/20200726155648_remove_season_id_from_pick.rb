class RemoveSeasonIdFromPick < ActiveRecord::Migration[6.0]
  def change
    remove_index :picks, column: :season_id
    remove_column :picks, :season_id
  end
end
