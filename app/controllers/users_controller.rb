# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user = User.safe_name(user)

    @favs = current_user.favs
    @article_favs = current_user.article_fav
  end
end
