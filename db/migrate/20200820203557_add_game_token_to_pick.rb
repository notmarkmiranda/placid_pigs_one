class AddGameTokenToPick < ActiveRecord::Migration[6.0]
  def change
    add_column :picks, :game_token, :string
  end
end
