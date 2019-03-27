class ApplicationController < ActionController::Base
  #attr_reader :git_service
	@@git_services = nil

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user

  private

    def authenticate_user
      redirect_to "https://github.com/login/oauth/authorize?client_id=#{ENV['GITHUB_CLIENT']}&scope=repo" if !logged_in?
    end

    def logged_in?
			@@git_services = GithubService.new unless @@git_services
      @@git_services.logged_in?
    end
end
