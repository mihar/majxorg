class CreateBookmarks < ActiveRecord::Migration
  def self.up
    create_table :bookmarks do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :tags
      t.string :delicious_id
      t.datetime :posted_at

      t.timestamps
    end
  end

  def self.down
    drop_table :bookmarks
  end
end
