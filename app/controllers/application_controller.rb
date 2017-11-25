class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def import
    Address.import(params[:file])
    redirect_to root_url, notice: "It worked!"
  end
end
