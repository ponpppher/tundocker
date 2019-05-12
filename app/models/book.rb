# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :regist_books, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :recommends, through: :groups, source: :recommend

  has_many :articles, dependent: :destroy

  validates :title, presence: true

  mount_uploader :image, ImageUploader
end
