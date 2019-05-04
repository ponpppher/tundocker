# frozen_string_literal: true

module BooksHelper
  def choose_new_or_edit
    if action_name == 'edit'
      book_path
    else
      books_path
    end
  end

  def is_regist?(book)
    current_user.regist_books.find_by(book_id: book.id)
  end
end
