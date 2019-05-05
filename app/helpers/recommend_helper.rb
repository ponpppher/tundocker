# frozen_string_literal: true

module RecommendHelper
  def recommend_choose_new_or_edit
    if action_name == 'edit'
      recommend_path
    else
      recommends_path
    end
  end
end
