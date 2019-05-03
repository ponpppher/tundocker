# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user = User.safe_name(user)
  end
end
