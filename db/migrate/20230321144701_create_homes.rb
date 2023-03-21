class CreateHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :homes do |t|

      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :amount
      t.integer :making_status

      t.timestamps
    end
  end
end
