class Subcommunity < ApplicationRecord
  validates :title, presence: true
  validates :slogan, presence: true

  has_many :posts
end
