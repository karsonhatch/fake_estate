class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :has_one
      t.seller :

      t.timestamps null: false
    end
  end
end
