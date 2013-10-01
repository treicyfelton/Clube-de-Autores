class AddUpdateToHistory < ActiveRecord::Migration
  def change
    add_column :histories, :updateHistory, :datetime
  end
end
