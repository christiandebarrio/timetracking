class ProjectsController < ApplicationController
  def index
    @projects = Project.first_updated_projects(10)
  end
end
