# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

protected

  def after_update_path_for(_resource)
    user_path(id: current_user.id) # after updated page
  end

  def after_sign_in_path_for(_resource)
    books_path # after logined page
  end
end