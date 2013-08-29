class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :limit=>50, :null=>false
      t.string :email, :limit=>100, :null=>false
      t.string :nick, :limit=>35, :null=>false
      t.string :password, :limit=>50, :null=>false
      t.date :born_at, :null=>false
      t.string :situation
      t.string :hobby, :limit=>150
      t.boolean :admin

      t.timestamps
    end
  end
end
