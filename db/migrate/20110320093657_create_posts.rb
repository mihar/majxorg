class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.text :body_html
      t.string :url
      t.string :permalink
      t.string :remote_id
      t.datetime :posted_at
      t.string :source

      t.timestamps
    end

    add_index :posts, :remote_id, :unique => true
  end

  def self.down
    drop_table :posts
  end
end
