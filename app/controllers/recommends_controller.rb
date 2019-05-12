# frozen_string_literal: true

class RecommendsController < ApplicationController
  before_action :set_recommend, only: [:edit, :show, :update, :destroy]

  def index
    @recommend = current_user.recommends

    # return favorite group here
  end

  def show
    @groups = @recommend.groups
    @user = User.safe_name(current_user)
  end

  def new
    @recommend = Recommend.new
    # @recommend.groups.build

    # require 3 books
    3.times { @recommend.books.build }
  end

  def create
    @recommend = current_user.recommends.new(recommend_params)

    # ipnut groups
    # @recommend.groups.each do |group|
    #   @recommend.books.build(group.book)
    # end

    if @recommend.save
      redirect_to recommends_path, flash: { notice: 'save your group' }
    else
      flash[:notice] = 'failed save group'
      render :new
    end
  end

  def edit
    @recommend.groups.build
  end

  def update
    if @recommend.update(recommend_params)
      redirect_to recommends_path
      # 個別ページに飛ばす？
    else
      flash[:notice] = 'failed update group'
      render :edit
    end
  end

  def destroy
    @recommend.destroy
    redirect_to recommends_path, flash: { notice: 'group deleted' }
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
