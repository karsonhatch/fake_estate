class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.integer :bedroom, null: false 
      t.float :bath, null: false
      t.integer :sqft, null: false
      t.string :style, null: false
      t.integer :story, null: false
      t.boolean :sold, null: false
      t.string :price, null: false
      t.belongs_to :seller

      t.timestamps null: false
    end








  end
end
