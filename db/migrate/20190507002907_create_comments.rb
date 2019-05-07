class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :article, foreign_key: true, null: false
      t.text :content, comment: "コメント本文"

      t.timestamps
    end
  end
end
