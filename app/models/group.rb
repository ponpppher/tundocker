# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :recommend
  belongs_to :book

#  accepts_nested_attributes_for :books, reject_if: :all_blank
end
