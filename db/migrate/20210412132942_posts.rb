class Posts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :text
      t.integer :likes, default: 0
      t.integer :reposts, default: 0

      t.timestamps
    end
  end
end
