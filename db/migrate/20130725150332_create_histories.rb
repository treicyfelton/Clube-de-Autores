class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string   :title, :limit=>70, :null=>false
      t.text     :description, :limit=>250
      t.string   :classification, :null=>false
      t.text     :note, :limit=>250
      t.text     :ahistory, :null=>false
      t.integer  :user_id, :null => false

      t.timestamps
    end
  end
end
