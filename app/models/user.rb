class User < ApplicationRecord
  validates :first_name,
    presence: true
  validates :last_name,
    presence: true
  validates :description,
  length: { minimum: 3 , message: "Ta description de profil doit faire au moins 3 caractères"}
  validates :age,
    presence: true,
    numericality: { greater_than: 0, message: "Ton age doit être supérieur à 0"}
  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Entre un email valide s'il te plait! :)"} 
  validates :password_digest,
  presence: true

  belongs_to :city
  has_many :gossips
  has_many :sent_private_messages, foreign_key: "sender_id", class_name: "PrivateMessage"
  has_many :received_private_messages, foreign_key: "recipient_id", class_name: "PrivateMessageRecipient"
  has_many :comments
  has_many :likes
  has_secure_password

  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest)
  end
end
