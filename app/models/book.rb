# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :regist_books, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :recommends, through: :groups, source: :recommend
  has_many :articles, dependent: :destroy

  # alias act_as_tagglable_on :tags
  acts_as_taggable

  validates :title, presence: true

  # to user carrierwave
  mount_uploader :image, ImageUploader
end
