class EntriesController < ApplicationController

  def index
    @project = Project.find_by(id: params[:project_id])
    date = Date.today
    @entries = @project.entries.where(date: date.beginning_of_month..date.end_of_month)
    @total_hours = @project.total_hours_in_month(date.month, date.year)
  end
end
