class RepositoriesController < ApplicationController
  def index
		@repos_array = @@git_services.get_repos		 
  end

  def create
		response = @@git_services.create_repo(params[:name])
    redirect_to '/'
  end
end
