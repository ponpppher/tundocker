# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :show, :update, :destroy]

  def index
    if params[:tag_name]
      @books = current_user.books.tagged_with(params[:tag_name].to_s)
      return
    end

    @q = current_user.books.ransack(params[:q])
    @books = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    # initialize other user's articles
    @other_articles = []

    other_users = User.where.not(id: current_user).reject { |u| u.articles.where(book_id: @book.id).empty? }
    other_users.each do |u|
      u.articles.where(book_id: @book.id).each { |article| @other_articles << article }
    end

    # return my articles
    @articles = current_user.articles.where(book_id: @book, user_id: current_user)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      # regist user's book list
      current_user.regist_books.build(book_id: @book.id).save
      redirect_to books_path, notice: t('views.message.regist_book')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: t('views.message.update_book')
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: t('views.message.delete_book')
  end

private

  def book_params
    params.require(:book).permit(:title, :publish_on, :sheets, :price, :image, :tag_list)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
