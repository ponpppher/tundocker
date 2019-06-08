# frozen_string_literal: true

class RecommendFavsController < ApplicationController
  before_action :set_recommend

  def create
    @recommend.fav(current_user)

    respond_to do |format|
      format.html { redirect_to request.referrer || recommends_path }
      format.js { render 'recommend_favs/fav' }
    end
  end

  def destroy
    @recommend.unfav(current_user)

    respond_to do |format|
      format.html { redirect_to request.referrer || recommends_path }
      format.js { render 'recommend_favs/fav' }
    end
  end

private

  def set_recommend
    @recommend = Recommend.find(params[:id])
  end
end
