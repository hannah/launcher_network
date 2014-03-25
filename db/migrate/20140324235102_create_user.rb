class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :role, null: false
      t.text :fun_fact

      t.timestamps
    end
  end
end
