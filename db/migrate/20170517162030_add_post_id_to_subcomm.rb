class AddPostIdToSubcomm < ActiveRecord::Migration[5.0]
  def change
    add_column :subcommunities, :post_id, :integer
  end
end
