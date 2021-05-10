class Tag < ApplicationRecord
  has_many :gossip_tagings
  has_many :gossips, through: :gossip_tagings
end
