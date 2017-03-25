class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_header
      t.string :post_test
      t.string :post_tags

      t.timestamps
    end
  end
end
