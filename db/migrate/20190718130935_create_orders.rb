class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.integer :payment_amount
      t.string :state
      t.datetime :completed_at
      t.string :name
      t.string :phone
      t.string :country
      t.string :zipcode
      t.string :address1
      t.string :address2
      t.text :note
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
