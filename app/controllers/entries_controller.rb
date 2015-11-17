class EntriesController < ApplicationController

  def index
    @project = Project.find_by(id: params[:id])
    @entries = @project.entries

    # @entries = Entry.find_by(project_id: params[:id])
  end
end
