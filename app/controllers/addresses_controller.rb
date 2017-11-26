class AddressesController < ApplicationController
  def index
    # @addresses = job(params[:id]).addresses
  end

  def import
    Address.import(params[:file], params[:job_id])
    redirect_to user_job_path(current_user, Job.find(params[:job_id])), notice: "It worked!"
  end
end
