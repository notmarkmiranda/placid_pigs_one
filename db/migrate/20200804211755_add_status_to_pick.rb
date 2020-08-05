class AddStatusToPick < ActiveRecord::Migration[6.0]
  def change
    add_column :picks, :status, :integer
  end
end
