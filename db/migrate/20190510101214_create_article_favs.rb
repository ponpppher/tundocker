class CreateArticleFavs < ActiveRecord::Migration[5.2]
  def change
    create_table :article_favs do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
    add_index :article_favs, [:user_id, :article_id], unique: true
  end
end
