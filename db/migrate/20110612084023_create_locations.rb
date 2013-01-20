class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.float :lat
      t.float :lng
      t.string :reverse
      t.datetime :located_at

      t.timestamps
    end

    add_index :locations, :located_at, :unique => true
  end

  def self.down
    drop_table :locations
  end
end
