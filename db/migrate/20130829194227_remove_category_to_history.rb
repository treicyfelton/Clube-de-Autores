class RemoveCategoryToHistory < ActiveRecord::Migration
  def up
    remove_column :histories, :category
  end

  def down
    add_column :histories, :category, :integer
  end
end
