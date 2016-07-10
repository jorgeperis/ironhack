class ColleaguesController < ApplicationController
  def new
    @colleague = Colleague.new
  end
  def create
    Colleague.create(name: params[:colleague][:name],project_id: params[:colleague][:project])
    redirect_to '/'
  end
  def details
    @colleague = Colleague.find(params[:id])
  end
end
