# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :show, :update, :destroy]
  def index
    @books = Book.all.order(updated_at: :desc)
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

  def update
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, flash: { notice: 'success delete book' }
  end

private

  def book_params
    params.require(:book).permit(:title, :publish_on, :sheets, :price, :image)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
