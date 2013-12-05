class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :sellprop_id
      t.integer :buyer_id
      t.integer :bid_val

      t.timestamps
    end
	add_index :bids, :sellprop_id
	add_index :bids, :buyer_id
  end
end
