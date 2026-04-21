class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :username, length: { minimum: 3, maximum: 20 }
  validates :profile, presence: true
  validates :affiliation, presence: true  
  validates :position, presence: true
  
  has_many :posts
end
