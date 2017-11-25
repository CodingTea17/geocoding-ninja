class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def import
    Address.import(params[:file])
    redirect_to root_url, notice: "It worked!"
  end

  def after_sign_in_path_for(resource_or_scope)
    current_user
  end
end
