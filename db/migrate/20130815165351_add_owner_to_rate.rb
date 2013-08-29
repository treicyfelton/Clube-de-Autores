class AddOwnerToRate < ActiveRecord::Migration
  def change
    add_column :rates, :owner, :integer
  end
end
