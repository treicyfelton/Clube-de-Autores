class AddModeratetimeToHistory < ActiveRecord::Migration
  def change
    add_column :histories, :moderateTime, :datetime
  end
end
