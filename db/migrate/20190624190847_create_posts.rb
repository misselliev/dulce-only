class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.integer :user_id
      t.index ["user_id"], name: "index_posts_on_user_id"
      t.timestamps
    end
  end
end
