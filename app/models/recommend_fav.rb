# frozen_string_literal: true

class RecommendFav < ApplicationRecord
  belongs_to :user
  belongs_to :recommend
end
