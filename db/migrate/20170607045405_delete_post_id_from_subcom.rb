class DeletePostIdFromSubcom < ActiveRecord::Migration[5.0]
  def change
    remove_column :subcommunities, :post_id, :integer
  end
end
