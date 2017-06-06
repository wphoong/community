class User < ApplicationRecord
  has_many :subcommunities, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscribed_subcoms, through: :subscriptions, source: :subcommunity, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def subscribed?(subcommunity)
    subscribed_subcoms.include?(subcommunity)
  end
end
