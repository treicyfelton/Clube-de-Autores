class AddFavoritesToHistory < ActiveRecord::Migration
  def change
    add_column :histories, :favorite_id, :integer
  end
end
