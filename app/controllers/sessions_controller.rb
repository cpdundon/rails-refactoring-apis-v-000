class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
		@@git_services.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code]) unless logged_in?
		uid = @@git_services.get_username
    session[:username] = uid

    redirect_to '/'
  end
end
