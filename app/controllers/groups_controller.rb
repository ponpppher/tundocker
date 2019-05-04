# frozen_string_literal: true

class GroupsController < ApplicationController
  def create; end

  def destroy; end

private

  def set_group
    @book = Book.find(params[:id])
  end
end
