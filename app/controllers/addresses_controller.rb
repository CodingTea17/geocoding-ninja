class AddressesController < ApplicationController
  def index
    # @addresses = job(params[:id]).addresses
  end

  def import
    Address.import(params[:file], params[:job_id])
    redirect_to root_url, notice: "It worked!"
  end
end
