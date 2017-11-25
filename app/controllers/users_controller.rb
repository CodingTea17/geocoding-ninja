class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @job = current_user.jobs.new
  end
end
