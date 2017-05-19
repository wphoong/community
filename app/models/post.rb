class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :subcommunity

  has_many :comments
end
