class Gossip < ApplicationRecord
  belongs_to :user
  has_many :gossip_tagings
  has_many :tags, through: :gossip_tagings
end
