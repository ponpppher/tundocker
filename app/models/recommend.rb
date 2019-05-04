# frozen_string_literal: true

class Recommend < ApplicationRecord
  belongs_to :user
  has_many :groups, dependent: :destroy
  has_many :group_books, through: :groups, source: :book
  accepts_nested_attributes_for :group_books
end
