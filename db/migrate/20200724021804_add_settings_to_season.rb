class AddSettingsToSeason < ActiveRecord::Migration[6.0]
  def change
    add_column :seasons, :start_date, :date
    add_column :seasons, :end_date, :date
    add_column :seasons, :increment_lock, :integer, default: 7
    add_column :seasons, :offset, :integer, default: 0
  end
end
