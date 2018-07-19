class RemoveColorFromCategory < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :color
  end
end
