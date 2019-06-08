# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :regist_books, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :recommends, through: :groups, source: :recommend
  has_many :articles, dependent: :destroy

  # to user carrierwave
  mount_uploader :image, ImageUploader

  # alias act_as_tagglable_on :tags
  acts_as_taggable

  # validate
  validates :title, presence: true, length: { in: 1..10_000 }
  validates :publish_on, presence: true, date: true
  validates :sheets, numericality: { allow_nil: true, only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, numericality: { allow_nil: true, only_integer: true, greater_than_or_equal_to: 0 }

  # define search validation by ransack
  def self.ransackable_attributes(*)
    %w[title]
  end

  def self.ransackable_associations(*)
    %w[articles]
  end
end
