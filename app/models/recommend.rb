# frozen_string_literal: true

class Recommend < ApplicationRecord
  belongs_to :user
  has_many :groups, dependent: :destroy
  has_many :books, through: :groups, source: :book

  # nested_params
  # accepts_nested_attributes_for :groups, allow_destroy: true
  accepts_nested_attributes_for :books
end
