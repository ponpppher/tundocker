# frozen_string_literal: true

class User < ApplicationRecord
  module NameGen
    (NAME = 'No Name').freeze
  end

  # book association
  has_many :regist_books, dependent: :destroy
  has_many :books, through: :regist_books

  # recommend association
  has_many :recommends, dependent: :destroy
  has_many :recommend_fav, dependent: :destroy
  has_many :favs, through: :recommend_fav, source: :recommend

  # article association
  has_many :articles, dependent: :destroy
  has_many :article_fav, dependent: :destroy
  has_many :article_favs, through: :article_fav, source: :article

  # comment association
  has_many :comments

  # devise setting
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  # validate
  validates :name, length: { maximum: 30 }
  validates :email, presence: true, length: { in: 1..254 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    user ||= User.create(
      name: auth.info.name,
      uid: auth.uid,
      provider: auth.provider,
      email: "#{auth.uid}-#{auth.provider}@example.com",
      username: auth.info.nickname,
      password: Devise.friendly_token[0, 20]
    )
    user
  end

  def safe_name
    name.blank? ? NameGen::NAME : name
  end
end
