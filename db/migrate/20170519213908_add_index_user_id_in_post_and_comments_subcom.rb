class AddIndexUserIdInPostAndCommentsSubcom < ActiveRecord::Migration[5.0]
  def change
    add_column :subcommunities, :user_id, :integer
    add_column :posts, :user_id, :integer
    add_column :comments, :user_id, :integer

    add_index :subcommunities, :user_id
    add_index :posts, %i[user_id subcommunity_id]
    add_index :comments, %i[user_id post_id]
  end
end
