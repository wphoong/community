class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :subcommunity_id
      t.timestamps
    end
    add_index :subscriptions, %i[user_id subcommunity_id]
    add_index :subscriptions, :subcommunity_id
  end
end
