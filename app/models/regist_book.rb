# frozen_string_literal: true

class RegistBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
