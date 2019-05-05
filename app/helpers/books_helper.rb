# frozen_string_literal: true

module BooksHelper
  def choose_new_or_edit
    if action_name == 'edit'
      book_path
    else
      books_path
    end
  end

  def book_articles(book)
    current_user.articles.where(book_id: book).order(updated_at: 'DESC').limit(5)
  end
end
