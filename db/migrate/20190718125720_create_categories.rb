class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.text :body
      t.string :avatar

      t.timestamps
    end
  end
end
