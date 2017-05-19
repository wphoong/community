class DeleteCommentIdFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :comment_id, :integer
  end
end
