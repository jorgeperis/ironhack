class TasksController < ApplicationController
  def new
    @task = Task.new
  end
  def create
    Task.create(name: params[:task][:name],
                start: params[:task][:start],
                finish: params[:task][:finish],
                project_id: params[:task][:project],
                colleague_id: params[:task][:colleague])
    redirect_to '/'
  end
  def details
    @task = Task.find(params[:id])
  end
end
