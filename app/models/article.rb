# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :book
  belongs_to :user

  # comments asocciation
  has_many :comments, dependent: :destroy

  # favorites asocciation
  has_many :article_fav, dependent: :destroy
  has_many :fav_user, through: :article_fav, source: :user

  # validate
  validates :title, presence: true, length: { in: 1..255 }
  validates :body, length: { maximum: 255 }

  def fav(user)
    article_fav.create(user_id: user.id)
  end

  def unfav(user)
    fav = article_fav.find_by(user_id: user.id)
    fav.destroy
  end

  def faved?(user)
    fav_user.where(id: user.id).exists?
  end
end
