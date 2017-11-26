class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @job = current_user.jobs.new
  end

  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html
      format.csv { send_data @job.addresses.to_csv(@job.id), filename: "addresses-#{Date.today}.csv" }
    end
  end

  def create
    @job = current_user.jobs.new(job_params)
    if @job.save
      flash[:success] = "Job successfully added!"
      redirect_to user_job_path(current_user, @job)
    else
      flash[:danger] = "IT'S A TRAP!!"
      render :index
    end
  end

private
  def job_params
    params.require(:job).permit(:name)
  end
end
