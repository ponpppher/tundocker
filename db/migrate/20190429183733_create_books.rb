class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false, comment: "本のタイトル"
      t.datetime :publish_on, comment: "出版日"
      t.integer :sheets, comment: "ページ数"
      t.integer :price, comment: "値段"
      t.string :image, comment: "本のサムネイル"

      t.timestamps
    end
  end
end
