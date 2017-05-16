class RemoveCommentIdFromPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :comment_id, :integer
  end
end
