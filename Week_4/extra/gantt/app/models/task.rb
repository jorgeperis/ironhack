class Task < ApplicationRecord
  belongs_to :project
  belongs_to :colleague

  def self.width(task)
    project = Project.find(task.project_id)
    projectdays = (project.finish - project.start).to_i
    taskdays = (task.finish - task.start).to_i
    width = (taskdays*100)/projectdays
  end
  def self.margin(task)
    project = Project.find(task.project_id)
    projectdays = (project.finish - project.start).to_i
    margindays = (task.start - project.start).to_i
    margin = (margindays*100)/projectdays
  end
end
