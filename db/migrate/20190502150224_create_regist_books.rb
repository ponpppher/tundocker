class CreateRegistBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :regist_books do |t|
      t.references :user, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false

      t.timestamps
    end

    add_index :regist_books, [:user_id, :book_id], unique: true
  end
end
