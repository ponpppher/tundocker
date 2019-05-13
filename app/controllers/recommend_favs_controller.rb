# frozen_string_literal: true

class RecommendFavsController < ApplicationController
  def create
    @recommend = Recommend.find(params[:id])
    @recommend.fav(current_user)

    respond_to do |format|
      format.html { redirect_to request.referrer || recommends_path }
      format.js { render 'recommend_favs/fav' }
    end
  end

  def destroy
    @recommend = Recommend.find(params[:id])
    @recommend.unfav(current_user)

    respond_to do |format|
      format.html { redirect_to request.referrer || recommends_path }
      format.js { render 'recommend_favs/fav' }
    end
  end
end
