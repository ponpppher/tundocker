module BooksHelper
  def choose_new_or_edit
    if action_name == 'edit'
      book_path
    else
      books_path
    end
  end
end
