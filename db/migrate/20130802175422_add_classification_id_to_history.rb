class AddClassificationIdToHistory < ActiveRecord::Migration
  def change
  	remove_column :histories, :classification
    add_column :histories, :classification_id, :integer
  end
end
