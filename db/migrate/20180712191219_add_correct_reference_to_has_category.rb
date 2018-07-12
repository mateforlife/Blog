class AddCorrectReferenceToHasCategory < ActiveRecord::Migration[5.1]
  def change
    remove_reference :has_categories, :caregory, index: true
    add_reference :has_categories, :category, index: true
  end
end
