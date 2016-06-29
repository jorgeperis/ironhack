require 'sinatra'
require 'sinatra/reloader'
require 'yaml/store'
require './lib/task.rb'
require './lib/todolist.rb'
require 'pry'

todo_list = TodoList.new("Josh")
todo_list.load_tasks

get '/tasks' do
  @tasques = todo_list.tasks
  erb :task_index
end

get '/new_task' do
 erb :new_task
end

post '/create_task' do
  content = params[:content]
  new_task = Task.new(content)
  todo_list.add_task(new_task)
  todo_list.save
  redirect to ('/tasks')
end

get '/complete_task/:id' do
  id = params[:id].to_i
  task = todo_list.find_task_by_id(id)
  task.complete!
  todo_list.save
  redirect to ('/tasks')
end

post '/delete_task/:id' do
  id = params[:id].to_i
  todo_list.delete_task(id)
  todo_list.save
  redirect to ('/tasks')
end

#choose what item to delete with a button in main
#choose what item to complete with a button in main
#change the way to count
#revise the tests for this exercice
