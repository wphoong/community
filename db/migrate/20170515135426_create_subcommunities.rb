class CreateSubcommunities < ActiveRecord::Migration[5.0]
  def change
    create_table :subcommunities do |t|
      t.string :title
      t.string :slogan
      t.timestamps
    end
  end
end
