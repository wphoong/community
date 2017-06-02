class Subcommunity < ApplicationRecord
  validates :title, presence: true
  validates :slogan, presence: true

  belongs_to :user

  has_many :subscriptions, dependent: :destroy
  has_many :posts, dependent: :destroy
end
