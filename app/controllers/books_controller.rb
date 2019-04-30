# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :show, :update, :destory]
  def index
    @books = Book.all
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, flash: { notice: 'success subscribe your book!' }
    else
      render :new
    end
  end

  def edit; end

  def destory; end

private

  def book_params
    params.require(:book).permit(:title, :publish_on, :sheets, :price, :image)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
