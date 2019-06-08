# frozen_string_literal: true

class ArticleFav < ApplicationRecord
  belongs_to :user
  belongs_to :article
end
