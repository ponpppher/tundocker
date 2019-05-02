# frozen_string_literal: true

class UsersController < ApplicationController
  module NameGen
    (NAME = 'no name').freeze
  end

  def show
    @user = User.find(params[:id])
    @user.name = NameGen::NAME if @user.name.empty?
  end
end
