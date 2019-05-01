# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

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
end
