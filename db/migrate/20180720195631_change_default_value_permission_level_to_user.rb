class ChangeDefaultValuePermissionLevelToUser < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:users, :permission_level, 0)
  end
end
