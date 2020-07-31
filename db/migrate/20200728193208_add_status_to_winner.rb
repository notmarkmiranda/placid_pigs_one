class AddStatusToWinner < ActiveRecord::Migration[6.0]
  def change
    add_column :winners, :status, :integer, default: 0
  end
end
