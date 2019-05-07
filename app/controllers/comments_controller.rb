# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :show, :update, :destroy]
  def new
    @comment = current_user.comment.build
  end

  def create; end

  def edit; end

  def update; end

  def destroy; end

private

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
