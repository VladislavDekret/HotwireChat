class RegistrationsController < Devise::RegistrationsController
  def name

  end

  private

  def after_sign_up_path_for(resource)
    root_path
  end
end
