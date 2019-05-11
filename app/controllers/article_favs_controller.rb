# frozen_string_literal: true

class ArticleFavsController < ApplicationController
  def create
    @article = Article.find_by(id: params[:id])
    @article.fav(current_user)
    render json: @article.id
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.unfav(current_user)
    render json: @article.id
  end
end
