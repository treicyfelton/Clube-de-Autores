class RemoveFavoriteToHistory < ActiveRecord::Migration
  def up
    remove_column :histories, :favorite_id
  end

  def down
    add_column :histories, :favorite_id, :integer
  end
end
