class AddPostIdIndexToSubcomm < ActiveRecord::Migration[5.0]
  def change
    add_index :subcommunities, :post_id
  end
end
