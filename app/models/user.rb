class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  validates :username,
            presence: true,
            uniqueness: true,
            length: { minimum: 3, maximum: 20, allow_blank: true }

  validates :profile, presence: true
  validates :affiliation, presence: true  
  validates :position, presence: true

  has_many :posts
  has_many :comments
end