class AddCreator < ActiveRecord::Migration
  def up
    add_column :interest_groups, :creator, :integer, null: false
  end
  def down
    remove_column :interest_groups, :creator
  end
end
