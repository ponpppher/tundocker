# frozen_string_literal: true

module BooksHelper
  require 'time'

  def book_choose_new_or_edit
    if action_name == 'edit'
      book_path
    else
      books_path
    end
  end

  def is_regist?(book)
    current_user.regist_books.find_by(book_id: book.id)
  end

  def book_articles(book)
    current_user.articles.where(book_id: book).order(updated_at: 'DESC').limit(5)
  end

  def time_present(book_date)
    book_date.strftime('%Y年 %m月%d日')
  end
end
