class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end
  def create
    Project.create(name: params[:project][:name],start: params[:project][:start],finish: params[:project][:finish])
    redirect_to colleague_new_path
  end
  def show
    redirect_to "/view/#{params[:project][:project]}"
  end
  def view
    @project = Project.find(params[:id])
    @days =(@project.finish - @project.start).to_i
  end
  def index
    return redirect_to new_path unless Project.first
  end
end
