# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :book
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :article_fav, dependent: :destroy
  has_many :fav_user, through: :article_fav, source: :user

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
