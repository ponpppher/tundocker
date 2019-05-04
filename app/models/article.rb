# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :book
  belongs_to :user
end
