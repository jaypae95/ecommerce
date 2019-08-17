class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :body
      t.string :avatar
      t.integer :price
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
