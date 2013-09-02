class AddModerationToHistory < ActiveRecord::Migration
  def change
    add_column :histories, :moderate, :boolean
  end
end
