class ProjectsController < ApplicationController
  def index
    @projects = Project.last_created_projects(10)
      if @projects.empty?
        render 'no_projects_found' #render template: 'ruta alternativa desde views'
      end
  end

  def show
    @project = Project.find_by(id: params[:id]) ||
      render_404(params) # defined in application_controller
  end
end
