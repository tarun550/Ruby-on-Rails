class Bid < ActiveRecord::Base
  attr_accessible :bid_val, :buyer_id, :sellprop_id
  belongs_to :buyer, :class_name => "User"
  validates :buyer_id, :presence => true
end
