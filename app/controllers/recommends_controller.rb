# frozen_string_literal: true

class RecommendsController < ApplicationController
  before_action :set_recommend, only: [:edit, :show, :update, :destroy]

  def index
    # user recommend
    @recommend = current_user.recommends

    # other user recommend
    @other_recommends = []
    other_users = User.where.not(id: current_user).reject { |u| u.recommends.empty? }
    other_users.each do |u|
      u.recommends.each { |rec| @other_recommends << rec }
    end
  end

  def show
    @groups = @recommend.groups
    @user = current_user
  end

  def new
    @recommend = Recommend.new

    # require 3 books
    3.times { @recommend.books.build }
  end

  def create
    @recommend = current_user.recommends.new(recommend_params)

    # byebug
    if @recommend.save
      redirect_to recommends_path, notice: t('views.message.book_group')
    else
      flash[:alert] = t('views.message.failed_book_group')
      render :new
    end
  end

  def edit
    @recommend.groups.build
  end

  def update
    if @recommend.update(recommend_params)
      redirect_to recommends_path, notice: t('views.message.update_book_group')
    else
      flash[:alert] = t('views.message.failed_update_book_group')
      render :edit
    end
  end

  def destroy
    @recommend.destroy
    redirect_to recommends_path, alert: t('views.message.delete_book_group')
  end

private

  def recommend_params
    params.require(:recommend).permit(
      :name,
      :summary,
      books_attributes: [
        :id,
        :_destroy,
        :title,
        :publish_on,
        :sheets,
        :price,
        :image
      ]
    )
  end

  def set_recommend
    @recommend = Recommend.find(params[:id])
  end
end
