class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.text :uprules, :null=>false

      t.timestamps
    end
  end
end
