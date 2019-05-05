# frozen_string_literal: true

module ArticlesHelper
  def article_choose_new_or_edit
    if action_name == 'edit'
      book_article_path
    else
      book_articles_path
    end
  end
end
