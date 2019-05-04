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

    # set group instance
    # @recommend.groups.build

    # set book instance
    3.times do
      @recommend.group_books.build
    end
  end

  def create
    @recommend = current_user.recommends.build(recommend_params)
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
      group_books_attributes: [
        :id,
        :title,
        :publish_on,
        :price,
        :sheets,
        :image
      ]
    )
  end

  def set_recommend
    @recommend = Recommend.find(params[:id])
  end
end
