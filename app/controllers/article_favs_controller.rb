# frozen_string_literal: true

class ArticleFavsController < ApplicationController
  before_action :set_article
  def create
    @article.fav(current_user)

    respond_to do |format|
      format.html { redirect_to request.referrer || books_path }
      format.js { render 'favs/fav' }
    end
  end

  def destroy
    @article.unfav(current_user)

    respond_to do |format|
      format.html { redirect_to request.referrrer || books_path }
      format.js { render 'favs/fav' }
    end
  end

private

  def set_article
    @article = Article.find_by(id: params[:id])
  end
end
