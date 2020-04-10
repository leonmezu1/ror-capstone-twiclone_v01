# Registration
class RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    if params['password']&.present?
      super
    elsif params['username'] != resource.username
      super
    elsif params['full_name'] != resource.full_name
      super
    elsif params['email'] != resource.email
      super
    else
      resource.update_without_password(params.except('current_password'))
    end
  end

  def after_update_path_for(current_user)
    user_path(current_user)
  end

  def after_sign_up_path_for(_resource)
    next_path
  end
end
