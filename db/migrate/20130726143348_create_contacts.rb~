class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :ctype, :null=>false
      t.string :subject, :null=>false
      t.string :cemail, :null=>false
      t.string :link, :null=>false
      t.text :message, :null=>false

      t.timestamps
    end
  end
end
