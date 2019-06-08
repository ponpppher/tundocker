# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    article = Article.find_by(id: params[:article_id])

    @comment = article.comments.build(comment_params)
    respond_to do |format|
      @comment.save
      format.js { render :index }
    end
  end

  def destroy
    @article = @comment.article
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to book_article_path(id: @article), notice: 'delete comment' }
      else
        format.html { redirect_to book_article_path(article_id: @article, id: @comment) }
      end
    end
  end

private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id).merge(user_id: current_user.id)
  end
end
