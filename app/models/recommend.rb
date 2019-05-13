# frozen_string_literal: true

class Recommend < ApplicationRecord
  belongs_to :user

  has_many :groups, dependent: :destroy
  has_many :books, through: :groups, source: :book

  has_many :recommend_fav, dependent: :destroy
  has_many :fav_user, through: :recommend_fav, source: :user

  # nested_params
  # accepts_nested_attributes_for :groups, allow_destroy: true
  accepts_nested_attributes_for :books

  def fav(user)
    recommend_fav.create(user_id: user.id)
  end

  def unfav(user)
    r = recommend_fav.find_by(user_id: user.id)
    r.destroy
  end

  def faved?(user)
    fav_user.where(id: user.id).exists?
  end
end
