# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
protected

  def after_update_path_for(_resource)
    user_path(id: current_user.id) # after updated page
  end
end
