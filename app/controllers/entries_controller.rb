class EntriesController < ApplicationController

  def index
    @project = Project.find_by(id: params[:project_id])
    date = Date.today
    @entries = @project.entries.where(date: date.beginning_of_month..date.end_of_month)
    @total_hours = @project.total_hours_in_month(date.month, date.year)
  end

  def new
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new #new entry with project_id
  end

  def create
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new(entry_params)

    if @entry.save
      redirect_to action: 'index', controller: 'entries', project_id: @project.id
    else      
      render 'new'
    end

  end

  private

  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
  end

end
