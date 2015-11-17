class ProjectsController < ApplicationController
  def index
    @projects = Project.last_created_projects(10)
  end

  def show
    @project = Project.find_by(id: params[:id]) ||
      render_404(params) # defined in application_controller
  end
end
