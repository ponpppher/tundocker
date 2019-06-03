class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.references :recommend, foreign_key: true
      t.references :book, foreign_key: true
      t.string :description, comment: "登録した本の詳細文"

      t.timestamps
    end
  end
end
