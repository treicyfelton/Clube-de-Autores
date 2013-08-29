class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :history_id
      t.integer :user_id
      t.integer :urate

      t.timestamps
    end
  end
end
