# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :regist_books, dependent: :destroy

  mount_uploader :image, ImageUploader
end
