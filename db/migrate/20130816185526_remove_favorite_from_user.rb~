class RemoveFavoriteFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :favorite_id
  end

  def self.down
    add_column :users, :favorite_id, :string
  end
end
