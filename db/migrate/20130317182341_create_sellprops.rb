class CreateSellprops < ActiveRecord::Migration
  def change
    create_table :sellprops do |t|
      t.string :classification
      t.integer :area
      t.string :location
      t.integer :min_bid
      t.integer :user_id

      t.timestamps
    end
  end
end
