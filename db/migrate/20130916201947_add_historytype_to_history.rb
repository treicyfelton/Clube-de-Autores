class AddHistorytypeToHistory < ActiveRecord::Migration
  def change
    add_column :histories, :historytype, :integer
  end
end
