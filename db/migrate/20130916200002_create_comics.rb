class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title
      t.integer :history_id

      t.timestamps
    end
  end
end
