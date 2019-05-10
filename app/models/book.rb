# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :regist_books, dependent: :destroy
  has_many :articles, dependent: :destroy

  # alias act_as_tagglable_on :tags
  acts_as_taggable

  # to user carrierwave
  mount_uploader :image, ImageUploader
end
