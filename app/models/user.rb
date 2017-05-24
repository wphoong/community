class User < ApplicationRecord
  has_many :subcommunities
  has_many :subscriptions
  has_many :posts
  has_many :comments
  has_many :subscribed_subcoms, through: :subscriptions, source: :subcommunity
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable


  def subscribed?(subcommunity)
    return subscribed_subcoms.include?(subcommunity)
  end

end
