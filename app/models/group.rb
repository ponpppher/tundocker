# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :recommend
  belongs_to :book
end
