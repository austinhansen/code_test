class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.integer :minor_x, allow_null: false
      t.integer :major_x, allow_null: false
      t.integer :minor_y, allow_null: false
      t.integer :major_y, allow_null: false
      t.text :grid

      t.timestamps
    end
  end
end
