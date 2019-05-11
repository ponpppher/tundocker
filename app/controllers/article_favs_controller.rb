# frozen_string_literal: true

class ArticleFavsController < ApplicationController
  def create
    @article = Article.find_by(id: params[:id])
    @article.fav(current_user)

    respond_to do |format|
      format.html { redirect_to request.referrer || books_path }
      format.js { render 'favs/fav' }
    end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.unfav(current_user)

    respond_to do |format|
      format.html { redirect_to request.referrrer || books_path }
      format.js { render 'favs/fav' }
    end
  end
end
