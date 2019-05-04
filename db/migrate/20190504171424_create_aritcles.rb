class CreateAritcles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false, comment: '記事のタイトル'
      t.text :body, comment: '記事の本文'
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :articles, [:user_id, :book_id]
  end
end
