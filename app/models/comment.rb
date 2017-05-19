class Comment < ApplicationRecord
  validates :message, presence: true
  
  belongs_to :post
end
