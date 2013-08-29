class CategoryHistory < ActiveRecord::Migration
  def self.up
    create_table :categories_histories do |t|
      t.references :category, :history
    end
  end

  def self.down
    drop_table :categories_histories
  end
end
