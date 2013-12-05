class Sellprop < ActiveRecord::Base
  attr_accessible :area, :location, :min_bid, :classificatiom, :id
  belongs_to :user
  has_many :buyers, :through => :bids
  validates :area, :presence => true
  validates :user_id, :presence => true
  validates :location, :presence => true
  validates :min_bid, :presence => true
  validates :classificatiom, :presence => true
  default_scope :order => 'sellprops.created_at DESC'
end
