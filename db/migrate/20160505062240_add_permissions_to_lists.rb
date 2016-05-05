class AddPermissionsToLists < ActiveRecord::Migration
  def change
    change_column :lists, :permissions, :string, default: "private"
  end
end
