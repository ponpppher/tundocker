class CreateRecommendFavs < ActiveRecord::Migration[5.2]
  def change
    create_table :recommend_favs do |t|
      t.references :user, foreign_key: true
      t.references :recommend, foreign_key: true

      t.timestamps
    end
    add_index :recommend_favs, [:user_id, :recommend_id], unique: true
  end
end
