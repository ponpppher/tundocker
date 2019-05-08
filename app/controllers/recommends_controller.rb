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
    @recommend.groups.build
    @recommend.books.build
    #@recommend.group_books.build

    # @recommend = @recommend.groups.build
    # set book instance
    #3.times do
    #  @recommend.group_books.build
    #end
  end

  def create
#    puts "params: #{recommend_params}"
#    puts "groups_param: #{recommend_params[:groups_attributes]}"
#    @recommend = current_user.recommends.new.groups.build(recommend_params[:groups_attributes][0])
#    puts "build: #{@recommend}"
#    # @recommend = current_user.recommends.build( { name: recommend_params[:recommend][:name], summary: recommend_params[:recommend][:summary] } )
#    book = Book.new(recommend_params[:books_attributes][0])
#    puts "book: #{book.title}"
#    @recommend[:book_id] = book.id
#    
#    puts "rec: #{@recommend.first.description}"
#    @recommend = current_user.recommends.new(recommend_params)
#    @recommend.groups.build(recommend_params[:groups_attributes][0])
#    @recommend.groups[:book] << Book.new([:books_attributes][0])

    #@recommend.books << recommend_params[:recommend][:books_attributes]
    if @recommend.save
      redirect_to recommends_path, flash: { notice: 'save your group' }
    else
      flash[:notice] = "#{@recommend.errors.full_messages}"
      #flash[:notice] = 'failed save group'
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

  def destro
    @recommend.destroy
    redirect_to recommends_path, flash: { notice: 'group deleted' }
  end

private

  def recommend_params
    params.require(:recommend).permit(
      :name,
      :summary,
      groups_attributes: [
        :id,
        :_destroy,
        :recommend_id,
        :book_id,
        :description,
#        books: [
#          :id,
#          :_destroy,
#          :title,
#          :publish_on,
#          :sheets,
#          :price,
#          :image,
#        ]
        books: []
      ],
      books_attributes: [
          :id,
          :_destroy,
          :title,
          :publish_on,
          :sheets,
          :price,
          :image,
      ]
    )
  end

  def set_recommend
    @recommend = Recommend.find(params[:id])
  end
end
