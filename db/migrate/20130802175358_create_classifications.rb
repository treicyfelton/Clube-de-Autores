class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.string :name
      t.integer :min_age

      t.timestamps
    end
  end
end
