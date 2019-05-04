# frozen_string_literal: true

module ArticlesHelper
  def article_choose_new_or_edit
    if action_name == 'edit'
      article_path
    else
      books_path
    end
  end
end
