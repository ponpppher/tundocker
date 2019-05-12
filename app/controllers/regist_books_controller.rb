# frozen_string_literal: true

class RegistBooksController < ApplicationController
  before_action :set_book, only: [:destroy]
  def create
    current_user.regist_books.create(book_id: params[:book_id])
    redirect_to books_path
  end

  def destroy
    regist = current_user.regist_books.find_by(book_id: @book)
    regist.destroy
    redirect_to books_path
  end

private

  def set_book
    @book = Book.find(params[:id])
  end
end
