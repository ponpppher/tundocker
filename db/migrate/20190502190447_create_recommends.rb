class CreateRecommends < ActiveRecord::Migration[5.2]
  def change
    create_table :recommends do |t|
      t.string :name, null: false, comment: 'グループ名'
      t.text :summary, null: false, comment: '概要'
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
