class ValidatesName < ActiveRecord::Migration
  def change
    change_table :interest_groups do |t|
      t.change(:name, :string, null: false)
    end
  end
end
