module ProjectsHelper

  def current_month_hours_for_project(project, date)
    project.total_hours_in_month(date.month, date.year)
  end
end
