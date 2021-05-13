class Gossip < ApplicationRecord
  validates :title,
    presence: true,
    length: { minimum: 3, maximum: 14, message: "Le titre de ton Gossip doit faire entre 3 et 14 caractères"}
  validates :content,
    presence: true
    
  belongs_to :user
  has_many :gossip_tagings
  has_many :tags, through: :gossip_tagings
  has_many :comments
  has_many :likes
end
