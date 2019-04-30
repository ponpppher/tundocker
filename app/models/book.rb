# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :image, ImageUploader
end
