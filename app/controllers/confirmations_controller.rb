class ConfirmationsController < Devise::ConfirmationsController

  protected

  def after_confirmation_path_for(resource_name, resource)
    "#{Secrets.site_url}?msg=#{URI.escape 'Your email has been confirmed!'}"
  end

end
