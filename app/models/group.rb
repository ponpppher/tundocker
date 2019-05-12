# frozen_string_literal: true

class Group < ApplicationRecord
  # belongs_to :recommend, optional: true
  # belongs_to :book, optional: true
  belongs_to :recommend
  belongs_to :book

  # accepts_nested_attributes_for :book, reject_if: :all_blank
end
