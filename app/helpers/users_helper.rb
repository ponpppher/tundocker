# frozen_string_literal: true

module UsersHelper
  require 'time'
  def time_present(user_date)
    user_date.strftime('%Y年 %m月%d日') unless user_date&.nil?
  end
end
