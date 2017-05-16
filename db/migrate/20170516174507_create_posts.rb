class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :subcommunity_id
      t.timestamps
    end
    add_index :posts, :subcommunity_id
  end
end
