class AddAboutAndStateToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :about, :text
    add_column :users, :state, :integer, default: 1
  end
end
